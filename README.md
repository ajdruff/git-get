# git-get

## NAME

git-get - same as git clone but without the cloning

## Quick Start

### Download the master branch without the repository

    git get https://github.com/tailwindcss/tailwindcss.git

### Download a specific branch

    git get -b next-patch https://github.com/tailwindcss/tailwindcss.git

### Download a release


### Download a release's zip file


## Usage

        Usage: git get [option...] <repository> [<directory>]

        -b          Branch  - branch to download, defaults to master
        -V          Verbose - Shows debugging output
        -d          Dry Run - Downloads repo to a temp directory
        -v          Version - shows version
        -h          Help    - show usage

## DESCRIPTION

Clones a repo but without the .git directory

When would you want to do this ?

* When you want to pull down a project's files into a current git repo without adding it as a submodule
* When you want a faster download for a project where you don't need the entire repo history
* When you want to get the zip archive using a similar command and path as the clone command


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
