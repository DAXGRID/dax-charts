#!/usr/bin/bash

get_docker_token() {
    DOCKER_USERNAME=""
    DOCKER_PASSWORD=""

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
    elif [[ "$CURRENT_TAG" =~ ^[0-9]+\.[0-9]+$ ]]; then
        version_regex="^[0-9]+.[0-9]+$"
    elif [[ "$CURRENT_TAG" =~ ^[0-9]+$ ]]; then
        version_regex="^[0-9]+$"
    fi

    response=$(curl -s "Authorization: Bearer ${TOKEN}" "https://hub.docker.com/v2/namespaces/${COMPANY}/repositories/${IMAGE_NAME}/tags?page_size=100")
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

filearray=($(find ./dax -type f -exec grep -Il -e "image: " {} +))

find ./dax -type f -exec grep -Il -e "^image:$" {} + |
    while IFS= read -r file; do
        echo "Processing: $file"

        repository=$(yq '(.. | select(kind == "map" and .repository != null) | .repository)' $file)
        tag=$(yq '(.. | select(kind == "map" and .tag != null) | .tag)' $file)

        token=$(get_docker_token)
        organization="${repository%%/*}"
        image_name="${repository#*/}"
        newest_tag=$(query_img_version $organization $image_name $token $tag)

        echo "Organization: $organization"
        echo "Image name: $image_name"
        echo "Current Tag: $tag"
        echo "Newest tag: $newest_tag"
        echo ""
    done


