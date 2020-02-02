# Building parser.sh

## About

parser.sh is the output of [argbash](https://argbash.io) parser generation script.

## Steps

1. edit parser.tpl as necessary
2. edit build.sh if you want to add or modify any arguments. This is necessary to build an accurate parser.m4 file.
3. run build

        ./build.sh NAME_OF_SCRIPT # , e.g.: ./build.sh git-get

   This will create a new $NAME_OF_SCRIPT.parser.sh and parser.m4.

4. Manually update the parser.tpl file with any changes you might need from the updated parser.m4 file

   The build script doesn't overwrite the real template, parser.tpl, to allow you to  manually copy over the sections you need. This is because you'll be making manual changes to the parser.tpl template that aren't possible to script.

   The first time you run the build script, you'll want to copy over the entire parser.m4 template to parser.tpl as a starting point. On each subsequent run, just copy over the parts that have changed (new or modified options)

5. Once you've modified parser.tpl manually, run ./build.sh a second time. This time your manual changes will be applied to the output.
6. Copy the contents of `parser/help`  over the to print-help function in git-get-parser.sh

        print_help()
        {

        cat <<EOF
        git get - Downloads just the working directory of a git repo

        Usage: git get [--branch BRANCH] [--zip] [--tar] [--export] [--keep-repo] [--dry-run] [--verbose]... [--version] [--help] <repository> [<directory>]

        Options:
        -b BRANCH, --branch BRANCH     The branch you want to download. [default: master].
        -z, --zip                      Download as zip [default: off].
        -t, --tar                      Download as tar.gz [default: off].
        -x, --export                   Uses the native git archive command so that the download respects export-ignore rules in .gitattributes. Can be used with either zip,tar, or uncompressed formats [default: off].
        -k, --keep-repo                Keep the .git directory [default: off].
        -d, --dry-run                  Uses system tmp directory for downloads so as to avoid cluttering the current directory. [default: off].
        -V VERBOSE, --verbose VERBOSE  Set verbose output (can be specified multiple times to increase the effect) [default: 0].
        -v, --version                  Prints version.
        -h, --help                     Prints help.

        Example: git get https://github.com/githubtraining/hellogitworld.git
        EOF

        }



7. Replace the following function with :


        handle_passed_args_count()
        {
                local _required_args_string="'repository'"
                test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: You didn\'t include the proper arguments. (Expecting y: $_required_args_string), but got only ${_positionals_count}." 1
                test "${_positionals_count}" -le 2 || _PRINT_HELP=yes die "FATAL ERROR: You included too many arguments.  (Expecting:  $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
        }




## To install Argbash

Take the following steps to install argbash as a Docker container.

Create `argbash-docker`:

        printf '%s\n' '#!/bin/bash' 'docker run -it --rm -v "$(pwd):/work" matejak/argbash "$@"' > argbash-docker

Create `argbash-init`

        printf '%s\n' '#!/bin/bash' 'docker run -it -e PROGRAM=argbash-init --rm -v "$(pwd):/work" matejak/argbash "$@"' > argbash-init-docker

Make `argbash-docker` and `argbash-init`  executable

        chmod a+x argbash-docker argbash-init-docker

Install `argbash-docker` and `argbash-init` in your path

        sudo install argbash-docker argbash-init-docker /usr/bin/