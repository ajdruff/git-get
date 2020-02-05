#!/usr/bin/env  bash

SCRIPT_DIR=
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

oneTimeSetup() {

    cleanup
    return 0

}

cleanup() {

    [ -d "unzip_hw" ] && rm -rf unzip_hw
    [ -d "hellogitworld" ] && rm -rf hellogitworld
    [ -d "feature_image" ] && rm -rf feature_image
    [ -d "RELEASE_1.1" ] && rm -rf RELEASE_1.1
    [ -d "test_untar" ] && rm -rf test_untar
    [ -d "temp" ] && rm -rf temp
    [ -d "test" ] && rm -rf test

    [ -f "hellogitworld-master.tar.gz" ] && rm hellogitworld-master.tar.gz

    [ -f "hellogitworld-master.zip" ] && rm hellogitworld-master.zip

}

oneTimeTearDown() {
    cleanup
    return 0
}

test_install() {

    (curl -L https://raw.githubusercontent.com/ajdruff/git-get/master/git-install.sh master | bash) || return 1
    git get -v || return 1
  #  docker run kcov/kcov /usr/bin/git-get

}

test_clone() {

    git get https://github.com/githubtraining/hellogitworld.git

    [ -d "hellogitworld" ] || return 1
    [ -d "hellogitworld/.git" ] && return 1
    [ -f "hellogitworld/fix.txt" ] || return 1
    [ -d "hellogitworld" ] && rm -rf hellogitworld

}

test_clone_branch() {
    git get -b feature_image https://github.com/githubtraining/hellogitworld.git feature_image

    [ -d "feature_image" ] || return 1
    [ -d "feature_image/.git" ] && return 1
    [ -f "feature_image/screenshot.png" ] || return 1

}

test_clone_release() {
    git get -b RELEASE_1.1 https://github.com/githubtraining/hellogitworld.git RELEASE_1.1

    [ -d "RELEASE_1.1" ] || return 1
    [ -d "RELEASE_1.1/.git" ] && return 1
    [ -f "RELEASE_1.1/resources/labels.properties" ] || return 1
    #rm rf hellogitworld

}

test_zip() {
    git get -z https://github.com/githubtraining/hellogitworld.git

    [ -f "hellogitworld-master.zip" ] || return 1

}

test_unzip() {

    rm -rf unzip_hw 2>/dev/null

    unzip hellogitworld-master.zip -d unzip_hw

    [ -f "unzip_hw/hellogitworld/README.txt" ] || return 1

    return 0

}

test_unzip_git_exists() {

    [ -d "unzip_hw/hellogitworld/.git" ] && return 1

    return 0

}

test_tar() {
    git get -t https://github.com/githubtraining/hellogitworld.git

    [ -f "hellogitworld-master.tar.gz" ] || return 1

}

test_untar() {

    mkdir -p test_untar
    tar -xzf hellogitworld-master.tar.gz -C test_untar

    [ -f "test_untar/hellogitworld/README.txt" ] || return 1

    return 0

}

test_untar_git_exists() {

    [ -d "test_untar/hellogitworld/.git" ] && return 1

    return 0
}

. "$SCRIPT_DIR"/shunit2
