#!/bin/bash

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11 #)Created by argbash-init v2.8.1
# ARG_OPTIONAL_SINGLE([branch],b,[The branch you want to download.],master)
# ARG_OPTIONAL_BOOLEAN([zip],z,[Download as zip],off)
# ARG_OPTIONAL_BOOLEAN([tar],t,[Download as tar.gz],off)
# ARG_OPTIONAL_BOOLEAN([export],x,[When used in combination with -z or -t, abides by export-ignore rules in .gitattributes.],off)
# ARG_OPTIONAL_BOOLEAN([dry-run],d,[Uses system tmp directory for downloads so doesnt clutter current directory. Ignored when used with -a],off)
# ARG_POSITIONAL_SINGLE([repository],[The git repository path])
# ARG_POSITIONAL_SINGLE([directory],[The local destination path for your downloaded files],null)
# ARG_DEFAULTS_POS
# ARG_VERBOSE([V])
# ARG_VERSION_AUTO([v0.1.1 git-get Copyright 2020 Andrew Druffner])
# ARG_HELP([Like git clone but without .git],[git get is a git extension that downloads project files without downloading its .git directory])
# ARGBASH_GO
# ARG_LEFTOVERS
# [ <-- needed because of Argbash

printf 'Value of --%s: %s\n' 'branch' "$_arg_branch"
printf "'%s' is %s\\n" 'zip' "$_arg_zip"
printf "'%s' is %s\\n" 'tar' "$_arg_tar"
printf "'%s' is %s\\n" 'export' "$_arg_export"
printf "'%s' is %s\\n" 'verbose' "$_arg_verbose"
printf "'%s' is %s\\n" 'dry-run' "$_arg_dry_run"
printf "'%s' is %s\\n" 'version' "$_arg_version"
printf "Value of '%s': %s\\n" 'repository' "$_arg_repository"
printf "Value of '%s': %s\\n" 'directory' "$_arg_directory"

# ] <-- needed because of Argbash
