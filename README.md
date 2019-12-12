# repomerge-action
GitHub Action to combine all our repos one repository.

Every repository will end up in it's own branch.

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
        destination: "github.com/ottojo/combined-test.git"
        pat: ${{ secrets.GH_PAT }}
        branch: repomerge-action
```
### Parameters
* `destination`: Path of the destination repository, without `https://` (does not have to be on GitHub)
* `pat`: Personal Access Token, used to authenticate for pushing to the destination (`https://$PAT@github.com/...`)
* `branch`: Name of branch in destination repository
