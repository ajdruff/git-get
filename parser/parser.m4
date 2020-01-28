#!/bin/bash

# m4_ignore(
echo "This is just a script template, not the script (yet) - pass it to 'argbash' to fix this." >&2
exit 11  #)Created by argbash-init v2.8.1
# ARG_OPTIONAL_SINGLE([branch])
# ARG_OPTIONAL_BOOLEAN([zip])
# ARG_OPTIONAL_BOOLEAN([tar])
# ARG_OPTIONAL_BOOLEAN([export])
# ARG_OPTIONAL_BOOLEAN([keep-repo])
# ARG_OPTIONAL_BOOLEAN([verbose])
# ARG_OPTIONAL_BOOLEAN([dry-run])
# ARG_OPTIONAL_BOOLEAN([version])
# ARG_POSITIONAL_SINGLE([repository])
# ARG_POSITIONAL_SINGLE([directory])
# ARG_DEFAULTS_POS
# ARG_HELP([<The general help message of my script>])
# ARGBASH_GO

# [ <-- needed because of Argbash

printf 'Value of --%s: %s\n' 'branch' "$_arg_branch"
printf "'%s' is %s\\n" 'zip' "$_arg_zip"
printf "'%s' is %s\\n" 'tar' "$_arg_tar"
printf "'%s' is %s\\n" 'export' "$_arg_export"
printf "'%s' is %s\\n" 'keep-repo' "$_arg_keep_repo"
printf "'%s' is %s\\n" 'verbose' "$_arg_verbose"
printf "'%s' is %s\\n" 'dry-run' "$_arg_dry_run"
printf "'%s' is %s\\n" 'version' "$_arg_version"
printf "Value of '%s': %s\\n" 'repository' "$_arg_repository"
printf "Value of '%s': %s\\n" 'directory' "$_arg_directory"

# ] <-- needed because of Argbash
