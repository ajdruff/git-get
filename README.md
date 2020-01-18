# git-get

## NAME

git-get - same as git clone but without the cloning

## Quick Start

change into the directory containing your repo

    cd myrepo

    git get


## Usage

    Usage: git get [option...]

    -a          shortdescription of a flag

## DESCRIPTION

Clones a repo but without the .git directory

## INSTALLATION

### REQUIREMENTS

### To install using wget

Execute the following one-liner from a bash shell on your local machine.

    sudo wget -O $(dirname $(which git))/git-get https://raw.githubusercontent.com/ajdruff/git-get/master/git-get;sudo chmod a+x $(dirname $(which git))/git-get;

This will download a copy to the same directory that the git binary is located in, and set the executable bit for the owner.

### To install manually

1. Download the `git-get` file from the latest tagged release or clone the repo. The latest version will always be in branch `master`. [All `git-get` releases are here](https://github.com/ajdruff/git-get/releases).

        cp git-get $(dirname $(which git))/

2. Once the script is in place, you can call it via git (don't call it directly).

        git get

> Note there is no dash `-` between 'git' and 'get'.

## EXAMPLES

### EXAMPLE 1

## License

[MIT License](https://github.com/ajdruff/git-get/blob/master/LICENSE)

## Credits


## AUTHOR

Written by Andrew Druffner andrew@nomstock.com
