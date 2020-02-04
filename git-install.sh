#!/usr/bin/env bash

REPO_NAME=git-get
TEMP_DIR="${TMPDIR:-/tmp}"
TEMP_REPO_DIR=$(mktemp -d "${TEMP_DIR}"/$REPO_NAME.XXXXXXXXX)

die() {
    echo "$*" 1>&2
    exit 1
}

get_latest_tag() {
    # Get new tags from the remote
    git fetch --tags

    # Get the latest tag name
    local latest_tag=$(git describe --tags $(git rev-list --tags --max-count=1))

    echo "$latest_tag"
    return 0
}



clone() {

    local branch

    cd "${TEMP_REPO_DIR}"
    git clone --no-checkout https://github.com/ajdruff/${REPO_NAME}.git || die "git-get: something went wrong trying to download installation files. Check your connection and try again"

    cd "${REPO_NAME}"

    if [ -z "${1}" ]; then
        branch=$(get_latest_tag)
    else
        branch="${1}"
    fi

    # Checkout the latest tag
    git checkout -b "${branch}"

    cd -

    return 0

}
install() {

    echo 'installing git-get...'
    local install_dir=$(dirname $(which git))

    if [ -d "$TEMP_REPO_DIR/dist" ]; then
        sudo install "$TEMP_REPO_DIR/dist/git-get" "${install_dir}"/
    else

        sudo install "$TEMP_REPO_DIR/git-get" "${install_dir}"/
        sudo install "$TEMP_REPO_DIR/parser/parser-build.sh" "${install_dir}"/

    fi

    return 0

}

clone;
install;

rm -rf "${TEMP_REPO_DIR}"/"${REPO_NAME}"

(git get -h && git get -v && echo 'git get installed!') || die "git-get installation failed"
