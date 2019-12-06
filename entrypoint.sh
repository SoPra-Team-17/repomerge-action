#!/bin/bash

ORG=$1
PAT=$3
DESTINATION_REPO="https://$PAT@$2"

echo "git-filter-repo version: $(git filter-repo --version)"

ORG_REPOS=$(curl https://api.github.com/orgs/$ORG/repos?per_page=200 | jq -r '.[] | .name')

for REPO in $ORG_REPOS; do
    echo "Cloning repo $REPO"
    git clone "https://github.com/$ORG/$REPO"
    cd $REPO
    echo "Filtering repo"
    git filter-repo --force --to-subdirectory-filter $REPO
    echo "Cleaning repo"
    git clean -f
    cd ..
done

echo "Creating directory for combined repo"
mkdir "combined_repo"
cd "combined_repo"

git init

for REPO in $ORG_REPOS; do
    echo "Adding remote: $REPO"
    git remote add -f "$REPO" "../$REPO"
    echo "Merging repo"
    git merge --allow-unrelated-histories -m "Import $REPO" "$REPO/master"
done

echo "Adding target remote"
git remote add origin "$DESTINATION_REPO"

echo "Pushing changes"
git push -f -u origin master
