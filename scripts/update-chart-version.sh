#!/usr/bin/env bash

chart_version="$(grep -w '^version:' $1/Chart.yaml)"
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

# Updates the appVersion in the chart file.
sed -i "/appVersion:.*/c\appVersion: \"$image_tag\"" "$1/Chart.yaml"

# Updates the version in the chart file.
sed -i "/^version:.*/c\version: $new_chart_version" "$1/Chart.yaml"

# Updates image tag in values file.
sed -i "/  tag:.*/c\  tag: v$image_tag" "$1/values.yaml"
