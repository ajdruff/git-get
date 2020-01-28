#!/usr/bin/env bash

# will overwrite git-get.m4, but use git-get.tpl as the template. this is so that you can manually integrate output to the template so it doesnt overwrite.
# Usage: build.sh git-get

build() {

    : ${1? ERROR Function: ${FUNCNAME[0]}() Usage: " ${FUNCNAME[0]} script_name"}

    local script_name="${1}"

    argbash-init-docker \
        --opt branch \
        --opt-bool zip \
        --opt-bool tar \
        --opt-bool export \
        --opt-bool keep-repo \
        --opt-bool verbose \
        --opt-bool dry-run \
        --opt-bool version \
        --pos repository \
        --pos directory \
        parser.m4 #  --mode minimal \

    argbash-docker \
        parser.tpl \
        --strip user-content \
        -o "${script_name}"-parser.sh

    argbash-docker \
        git-get-parser.sh \
        --type docopt \
        --strip all \
        -o help

    sudo chmod a+w ./"${script_name}"-parser.sh
    sudo chmod a+w ./parser.m4

}

build "${1}"
