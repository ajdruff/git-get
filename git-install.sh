#!/usr/bin/env bash

install() {

    local install_dir=$(dirname $(which git))

    sudo install ./git-get "${install_dir}"/
    sudo install ./parser/git-get-parser.sh "${install_dir}"/

}

install
