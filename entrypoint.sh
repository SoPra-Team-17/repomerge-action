#!/bin/bash

# Fail when any command fails
set -e

PAT=$2
DESTINATION_REPO="https://$PAT@$1"
DESTINATION_BRANCH=$3

echo "git version: $(git --version)"

echo "Adding target remote"
git remote add target "$DESTINATION_REPO"

echo "Pushing changes $GITHUB_REF:$DESTINATION_BRANCH"
git push target "$GITHUB_REF:$DESTINATION_BRANCH"
