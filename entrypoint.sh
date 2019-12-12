#!/bin/bash

# Fail when any command fails
set -e

PAT=$2
DESTINATION_REPO="https://$PAT@$1"
DESTINATION_BRANCH=$3

echo "git version: $(git --version)"

echo "Adding target remote"
git remote add target "$DESTINATION_REPO"

echo "Pushing changes"
git push target "$(git rev-parse --abbrev-ref HEAD):$DESTINATION_BRANCH"
