#!/usr/bin/bash

set -e

DOCKER_USERNAME=$1
DOCKER_PASSWORD=$2

# By switching to the directory of the file, the current path of the script executor becomes inconsequential.
cd "$(dirname "$0")"
cd ..

get_docker_token() {
    token=$(curl -s --json "{\"identifier\":\"$DOCKER_USERNAME\",\"secret\":\"$DOCKER_PASSWORD\"}" "https://hub.docker.com/v2/auth/token" | jq -r ".access_token")
    echo $token
}

query_img_version() {
    COMPANY=$1
    IMAGE_NAME=$2
    TOKEN=$3
    CURRENT_TAG=$4

# This is a bit ugly, but the best way I could figure out how to handle it with different version names.
    version_regex="^[vV0-9]+.[0-9]+(.[0-9]+[a-zA-Z0-9-]{0,})?$"
    if [[ "$CURRENT_TAG" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        version_regex="^v[0-9]+.[0-9]+.[0-9]+$"
    elif [[ "$CURRENT_TAG" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        version_regex="^[0-9]+.[0-9]+.[0-9]+$"
    elif [[ "$CURRENT_TAG" =~ ^[0-9]+\.[0-9]+-[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        version_regex="^[0-9]+\.[0-9]+-[0-9]+\.[0-9]+\.[0-9]+$"
    elif [[ "$CURRENT_TAG" =~ ^v[0-9]+.[0-9]+$ ]]; then
        version_regex="^v[0-9]+.[0-9]+$"
    elif [[ "$CURRENT_TAG" =~ ^[0-9]+.[0-9]+-trixie$ ]]; then
        version_regex="^[0-9]+.[0-9]+-trixie$"
    elif [[ "$CURRENT_TAG" =~ ^[0-9]+\.[0-9]+$ ]]; then
        version_regex="^[0-9]+.[0-9]+$"
    elif [[ "$CURRENT_TAG" =~ ^[0-9]+$ ]]; then
        version_regex="^[0-9]+$"
    fi

    response=$(curl -s -H "Authorization: Bearer ${TOKEN}" "https://hub.docker.com/v2/namespaces/${COMPANY}/repositories/${IMAGE_NAME}/tags?page_size=100")

    echo $response | jq -r --arg regex "$version_regex" '
  .results
  | map(select(.name | test($regex)))
  | max_by(
      .name
      | sub("^v"; "")
      | [scan("[0-9]+") | tonumber]
    )
  | .name
'
}

git pull --rebase

token=$(get_docker_token)

find ./dax -type f -exec grep -Il -e "^image:$" {} + |
    while IFS= read -r file; do
        echo "Checking: $file"

        combined=$(yq -o=json '[(.. | select(kind == "map" and key == "image"))]' $file)

        while IFS=$'\t' read -r repository tag; do
            if [[ "$repository" =~ "/" ]]; then
                organization="${repository%%/*}"
                image_name="${repository#*/}"
            else
                organization="library"
                image_name="$repository"
            fi

            newest_tag=$(query_img_version $organization $image_name $token $tag)

            if [[ -n "$newest_tag" ]]; then
                echo "Checking for $repository in $file"
                if [[ "$tag" != "$newest_tag" ]]; then
                    echo "Organization: $organization"
                    echo "Image name: $image_name"
                    echo "Updating $tag to $newest_tag"
                    sed -i "/repository: ${repository%%/*}\/$image_name/{n;s/tag: $tag/tag: $newest_tag/;}" "$file"

                    chart_path="$(dirname "$file")/Chart.yaml"
                    chart_version="$(grep -w '^version:' $chart_path)"
                    chart_name="$(yq '.name' "$chart_path")"
                    old_app_version="$(yq '.appVersion' "$chart_path")"

                    image_tag=$2
                    major=0
                    minor=0
                    build=0

                    # break down the chart version number into it's components
                    regex="([0-9]+).([0-9]+).([0-9]+)"
                    if [[ $chart_version =~ $regex ]]; then
                        major="${BASH_REMATCH[1]}"
                        minor="${BASH_REMATCH[2]}"
                        build="${BASH_REMATCH[3]}"
                    fi

                    build=$(echo $build + 1 | bc)
                    new_chart_version="${major}.${minor}.${build}"

                    if [[ "$chart_name" == *"$image_name"* || "$old_app_version" == *"$tag"* ]]; then
                        # Updates the appVersion in the chart file.
                        sed -i "/appVersion:.*/c\appVersion: \"$newest_tag\"" "$chart_path"
                    fi

                    # Updates the version in the chart file.
                    sed -i "/^version:.*/c\version: $new_chart_version" "$chart_path"

                    git add .
                    git commit -m "updated $image_name to $newest_tag in $file"
                fi
            else
                echo "Could not find tag for $image_name."
            fi

            echo ""
        done < <(jq -r '.[] | [.repository, .tag] | @tsv' <<< "$combined")
    done

git push
