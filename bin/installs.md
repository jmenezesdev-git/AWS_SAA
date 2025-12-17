# https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html#install-sam-cli-instructions
#
# https://github.com/aws/aws-sam-cli/releases/latest/download/AWS_SAM_CLI_64_PY3.msi
# for windows, needed to make a shortcut to make git bash see things correctly.

<!-- file in path executable directory containing: 

#!/bin/sh

# Execute the actual sam.bat file, passing all arguments ($@) to it.
# The path to sam.bat is constructed from your known PATH variable.
exec "/c/Users/<username>/PathExecutables/sam.cmd" "$@" -->

# also available for OSX/Linux


# test with same --version


# cfn-lint


# pip install cfn-lint