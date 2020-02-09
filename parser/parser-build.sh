#!/usr/bin/env bash


#######################
# git-get build script
#
# 1. creates parser/parser.sh
# 2. creates dist/get-get
#
#
#########
# will overwrite git-get.m4, but use git-get.tpl as the template. this is so that you can manually integrate output to the template so it doesnt overwrite.
# Usage: build.sh git-get
SCRIPT_DIR=
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

build() {



    sudo  argbash-init \
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
        "$SCRIPT_DIR/parser.m4"


    sudo argbash \
        "$SCRIPT_DIR/parser.tpl" \
        --strip user-content \
        -o "$SCRIPT_DIR/parser.sh"

    sudo argbash \
       "$SCRIPT_DIR/parser.sh" \
        --type docopt \
        --strip all \
        -o "$SCRIPT_DIR/${SCRIPT_NAME}"

mv -f "$SCRIPT_DIR/${SCRIPT_NAME}" "$SCRIPT_DIR/help"





}



allow_editing(){
    sudo chmod a+w "$SCRIPT_DIR/parser.sh"
    sudo chmod a+w "$SCRIPT_DIR/parser.m4"
}

replace_help(){
local heading
local footer
local help_content


 heading="\ngit get - Downloads just the working directory of a git repo\n"
footer="\n\nExample: git get  https://github.com/githubtraining/hellogitworld.git\n"

help_content="cat<<EOF\n$heading"
help_content+=$(cat "$SCRIPT_DIR"/help)
help_content+="$footer\nEOF"

 perl -0777 -i -pe "s|print_help\(\).*?}|print_help\(\)\n{\n$help_content\n}|s" "$SCRIPT_DIR/parser.sh"
}

replace_validation_errors(){
local too_few_message=
too_few_message='"FATAL ERROR: Too few arguments.  (Expecting: \$_required_args_string)." 1'

local too_many_message=
too_many_message='"FATAL ERROR: You included too many arguments.  (Expecting:  \$_required_args_string), but got \${_positionals_count} (the last one was: \${_last_positional})." 1'

perl -0777 -i -pe "s|\"FATAL ERROR: Not enough positional arguments.*?\" 1|$too_few_message \n|s"  "$SCRIPT_DIR/parser.sh"
perl -0777 -i -pe "s|\"FATAL ERROR: There were spurious positional arguments.*?\" 1|$too_many_message \n|s" "$SCRIPT_DIR/parser.sh"


}



#############################
#  Main
: "${1? ERROR Function: ${FUNCNAME[0]}() Usage: ${FUNCNAME[0]} SCRIPT_NAME}"#
SCRIPT_NAME="${1}"
build  "${SCRIPT_NAME}"
replace_help
replace_validation_errors
allow_editing
