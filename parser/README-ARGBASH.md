# Building parser.sh


## About

parser.sh is the output of [argbash](https://argbash.io) parser generation script.

## Steps

1. edit parser.tpl as necessary
2. edit build.sh if you want to add or modify any arguments. This is necessary to build an accurate parser.m4 file.
3. run build

    ./build.sh NAME_OF_SCRIPT # , e.g.: ./build.sh git-get

This will create a new $NAME_OF_SCRIPT.parser.sh and parser.m4.

It doesn't overwrite the real template, parser.tpl, to allow you to  manually copy over the sections you need.

On first run, you might copy over the entire template to parser.tpl as a starting point. On each subsequent run, just copy over the parts that have changed (new or modified options)

1. Once you've modified parser.tpl manually, run ./build.sh a second time. This time your manual changes will be applied to the output.
2. Copy over the git-get-help contents over to to print-help funcajdruff@ajsbox:~/dev/sandbox/argbash$ sudo install argbash-docker argbash-init-docker /usr/bin/tion.

## To install Argbash

Install Argbash as a Docker container.ajdruff@ajsbox:~/dev/sandbox/argbash$ sudo install argbash-docker argbash-init-docker /usr/bin/

Create `argbash-docker`:

        printf '%s\n' '#!/bin/bash' 'docker run -it --rm -v "$(pwd):/work" matejak/argbash "$@"' > argbash-docker

Create `argbash-init`

        printf '%s\n' '#!/bin/bash' 'docker run -it -e PROGRAM=argbash-init --rm -v "$(pwd):/work" matejak/argbash "$@"' > argbash-init-docker

Make them executable

        chmod a+x argbash-docker argbash-init-docker

Install in your path

        sudo install argbash-docker argbash-init-docker /usr/bin/


# ARG_HELP([Like git clone but without .git],[git get is a git extension that downloads project files without downloading its .git directory])