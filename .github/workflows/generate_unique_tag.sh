#!/bin/bash

# Base tag name using the current date
BASE_TAG=$(date +'%Y%m%d')
TAG=$BASE_TAG

# Check if the tag already exists
COUNTER=1
while git ls-remote --tags origin | grep -q "refs/tags/$TAG$"; do
  TAG="${BASE_TAG}-${COUNTER}"
  COUNTER=$((COUNTER + 1))
done

# Output the unique tag
echo "Unique tag found: $TAG"
echo "tag_name=$TAG" >> $GITHUB_OUTPUT
