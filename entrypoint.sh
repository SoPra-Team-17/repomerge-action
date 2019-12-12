#!/bin/bash

# Fail when any command fails
set -e

PAT=$2
DESTINATION_REPO="https://$PAT@$1"
DESTINATION_BRANCH=$3

echo "git version: $(git --version)"

echo "Adding target remote"
git remote add target "$DESTINATION_REPO"

BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch is $BRANCH"

echo "Pushing changes $BRANCH:$DESTINATION_BRANCH"
git push target "$BRANCH:$DESTINATION_BRANCH"
