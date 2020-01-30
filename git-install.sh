#!/usr/bin/env bash



clone (){

local repo_name=git-get
git clone --no-checkout git@github.com:ajdruff/${repo_name}.git

cd ${repo_name}

    # Get new tags from the remote
git fetch --tags

# Get the latest tag name
local latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)

# Checkout the latest tag
git checkout -b "${latest_tag}"

}
install() {
echo 'installing git-get...'
    local install_dir=$(dirname $(which git))

    sudo install ./git-get "${install_dir}"/
    sudo install ./parser/git-get-parser.sh "${install_dir}"/

echo 'done'
}

clone
install