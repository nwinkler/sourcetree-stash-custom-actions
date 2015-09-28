#!/bin/bash

# SourceTree Custom Action - Copy Commit Message
# Copies the commit message of the selected commit to the clipboard
#
# SourceTree Parameters: $SHA

git log $1 -1 --format=%B|pbcopy