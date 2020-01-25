# How to create argbash script


1. edit git-get.tpl as necessary
2. edit git-get-build.sh if you want to add or modify any arguments. This is necessary to build an accurate git-get.m4 file.
3. run build

    ./git-get-build.sh

This will create a new git-get.parser.sh and git-get.m4.

It doesn't overwrite the real template, git-get.tpl, to allow you to  manually copy over the sections you need.

On first run, you might copy over the entire template to git-get.tpl as a starting point. On each subsequent run, just copy over the parts that have changed (new or modified options)

1. Once you've modified git-get.tpl manually, run ./git-get-build.sh a second time. This time your manual changes will be applied to the output.
2. Copy over the git-get-help contents over to to print-help function.
3. 