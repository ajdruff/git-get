#!/usr/bin/env bash


repo_name=git-get
temp_dir="${TMPDIR:-/tmp}"
temp_repo_dir=$(mktemp -d "${temp_dir}"/$repo_name.XXXXXXXXX)

die() { echo "$*" 1>&2 ; exit 1; }

clone (){

cd "${temp_repo_dir}"
git clone --no-checkout https://github.com/ajdruff/${repo_name}.git || die "git-get: something went wrong trying to download installation files. Check your connection and try again"




cd "${repo_name}"

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



}

clone
install


rm -rf "${temp_repo_dir}"/"${repo_name}"

(git get -h && git get -v && echo 'git get installed!') || die "git-get installation failed"

