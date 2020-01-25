#!/usr/bin/env bash

# will overwrite git-get.m4, but use git-get.tpl as the template. this is so that you can manually integrate output to the template so it doesnt overwrite.

./argbash-init-docker \
    --opt branch \
    --opt-bool zip \
    --opt-bool tar \
    --opt-bool export \
    --opt-bool verbose \
    --opt-bool dry-run \
    --opt-bool version \
    --pos repository \
    --pos directory \
    \
    git-get.m4 #  --mode minimal \

./argbash-docker \
    git-get.tpl \
    -o git-get-parser.sh

./argbash-docker \
    git-get-parser.sh \
    --type docopt \
    --strip all \
    -o get-get-help

sudo chmod a+w ./git-get-parser.sh
