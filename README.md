# repomerge-action
GitHub Action to combine all the repos from one GitHub organization into one repository, preserving the history.

Every repository will end up in it's own subdirectory.

## Usage
This is an example GitHub workflow file (`.github/workflows/combine.yml`)
```yml
name: Combine Repos
on: 
  push:
    branches:
      - master
jobs:
  combine:
    runs-on: ubuntu-latest
    steps:
    - name: Combine repos
      uses: SoPra-Team-17/repomerge-action@master
      with:
        org: "SoPra-Team-17"
        destination: "github.com/ottojo/combined-test.git"
        pat: ${{ secrets.GH_PAT }}
```
### Parameters
* `org`: Name of the GitHub organization
* `destination`: Path of the destination repository, without `https://` (does not have to be on GitHub)
* `pat`: Personal Access Token, used to authenticate for pushing to the destination (`https://$PAT@github.com/...`)
