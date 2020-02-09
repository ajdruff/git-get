#!/usr/bin/env bash

################################
# git-get build script
#
# builds git-get for distribution
#
# The git-get script in the root of the repo
# is intended for development, since it uses source to add the parser
# This is done to declutter the main script for ease of use during development
# But this  isn't ideal for production since it means you'd need to distribute 2 files
# This build script will combine the parser and git-get script into a single file
# that will be copied by the install script into  the directory of git
#

# 1. creates parser/parser.sh
# 2. creates dist/git-get
#
#
#################################
SCRIPT_DIR=
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

#build the parser
#this creates the parser/parser.sh script
"$SCRIPT_DIR"/parser/parser-build.sh "git-get"

#prepare the git-get script for distribution by in-lining the parser.
#do this by splitting the development version of ./git-get in half ( a header and footer), and appending the peices together with
# the parser in between
mkdir -p "$SCRIPT_DIR"/dist/
cp "$SCRIPT_DIR"/git-get "$SCRIPT_DIR"/dist/git-get-header
cp "$SCRIPT_DIR"/git-get "$SCRIPT_DIR"/dist/git-get-footer

# remove the bottom part of the script to create the 'header'
#perl -0777 -i -pe "s|^#.*?_ADD_PARSER_HERE_#.*?\n||m" "$SCRIPT_DIR"/dist/git-get-header
perl -0777 -i -pe "s|^#.*?_ADD_PARSER_HERE_#(.*\n)*.*||m" "$SCRIPT_DIR"/dist/git-get-header

# remove the top part of the script to create the 'footer'
# m = multiple line match
# .* to match very last line that doesnt have a newline
perl -0777 -i -pe "s|(.*\n)*.*_ADD_PARSER_HERE_.*$||m" "$SCRIPT_DIR"/dist/git-get-footer


# append all the pieces together

parser_script=$(cat "$SCRIPT_DIR/parser/parser.sh")
header=$(cat "$SCRIPT_DIR"/dist/git-get-header)
footer=$(cat "$SCRIPT_DIR"/dist/git-get-footer)

echo -e "$header" > "$SCRIPT_DIR"/dist/git-get
echo -e "$parser_script" >> "$SCRIPT_DIR"/dist/git-get
echo -e "$footer" >> "$SCRIPT_DIR"/dist/git-get


# remove source statement sinec we in-lining  it
sed -ri 's/(.?.?source .*\/parser.*)//' dist/git-get

rm  "$SCRIPT_DIR"/dist/git-get-header
rm  "$SCRIPT_DIR"/dist/git-get-footer

#############################
#  Main


