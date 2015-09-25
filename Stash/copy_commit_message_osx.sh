#!/bin/bash

# SourceTree Custom Action - Copy Commit Message
# Copies the commit message of the selected commit to the clipboard
#
# SourceTree Parameters: $SHA

set SHA=$1

git log --format=%B -n 1 $SHA |tr '\n' ' '| pbcopy