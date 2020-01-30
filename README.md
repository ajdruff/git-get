# git-get

git-get is a git extension that makes it a little easier to download files stored in a remote git repository. Use it when you just want the repo's files and won't be making changes to the code, or will be commiting it to a different repo and dont need to retain the repo's history.

It does the same thing as clone does, by pulling down the files of the specified branch of the repository (master by default)

## INSTALLATION

Install the latest release using:

    curl -L https://raw.githubusercontent.com/ajdruff/git-get/master/git-install.sh | bash

**OR**

Install a specific branch or release

    git clone --branch v0.0.1 git@github.com:ajdruff/git-get.git
    cd git-get
    sudo chmod +x ./git-get
    sudo cp ./git-get $(dirname $(which git))/
    sudo cp  ./parser/git-get-parser.sh $(dirname $(which git))/

## Quick Start

### Get the master branch without the repository

    git get https://github.com/tailwindcss/tailwindcss.git

### Get a zipped archive that doesnt include .git folder

    git get -z https://github.com/tailwindcss/tailwindcss.git

> -t can be used to give a tar archive instead

## Why not just use git clone

* `git get` allows you to add a project's files to your project without having to add it as a submodule or manually deleting its .git folder.
* `git get`  will automatically include all the submodules needed for the project (without their corresponding git directories by default)
* `git get`  can easily get a zip or tar of a repo, complete with its submodules. Although the git builtin `git archive` supports zip and tar, it doesnt include a projects submodules.


## Using `git get` vs just `git`


| What you want to do |      Using just `git`   |  Using `git get` |
|----------|:-------------:|------:|
| download all files in master except the .git directory | git get https://path/to/repo.git ;cd repo; rm -rf .git|git get  https://path/to/repo.git
| download all files except .git directory  as an archive in tar.gz format | git clone https://path/to/repo.git; cd repo;  git archive -o latest.tar.gz HEAD |  git get -t https://path/to/repo.git
| download all files except .git directory as an archive in zip format | git clone https://path/to/repo.git; cd repo;  git archive -o latest.zip HEAD |  git get -z https://path/to/repo.git
| clone a repository| git clone https://path/to/repo.git | git get -k https://path/to/repo.git|

## Examples

A few examples using a sample repository.

### Get the master branch without the repository

    git get https://github.com/githubtraining/hellogitworld.git

### Get a specific branch

    git get -b git-pages https://github.com/githubtraining/hellogitworld.git

### Get a release

    git get -b RELEASE_1.1  https://github.com/githubtraining/hellogitworld.git

### Get a zipped archive

    git get -z https://github.com/githubtraining/hellogitworld.git

### Get a tarred archive

    git get -t https://github.com/githubtraining/hellogitworld.git


## Usage

    Usage: git get [--branch BRANCH] [--zip] [--tar] [--export] [--keep-repo] [--dry-run] [--verbose]... [--version] [--help] <repository> [<directory>]

    Options:
    -b BRANCH, --branch BRANCH     The branch you want to download. [default: master].
    -z, --zip                      Download as zip [default: off].
    -t, --tar                      Download as tar.gz [default: off].
    -x, --export                   When used in combination with -z or -t, abides by export-ignore rules in .gitattributes. [default: off].
    -k, --keep-repo                Keep the .git directory [default: off].
    -d, --dry-run                  Uses system tmp directory for downloads so doesnt clutter current directory. Ignored when used with -a [default: off].
    -V VERBOSE, --verbose VERBOSE  Set verbose output (can be specified multiple times to increase the effect) [default: 0].
    -v, --version                  Prints version.
    -h, --help                     Prints help.




## License

[MIT License](https://github.com/ajdruff/git-get/blob/master/LICENSE)


## AUTHOR

Written by Andrew Druffner andrew@nomstock.com
