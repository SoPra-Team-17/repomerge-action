#!/bin/bash

# Fail when any command fails
set -e

PAT=$2
DESTINATION_REPO="https://$PAT@$1"
DESTINATION_BRANCH=$3
SRC_BRANCH=$4

echo "git version: $(git --version)"

git checkout "$SRC_BRANCH"

echo "Adding target remote"
git remote add target "$DESTINATION_REPO"

git fetch --all

echo "Pushing changes $(git rev-parse --abbrev-ref HEAD):$DESTINATION_BRANCH"
git push target "$(git rev-parse --abbrev-ref HEAD):$DESTINATION_BRANCH"
