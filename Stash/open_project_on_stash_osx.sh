#!/bin/bash

# Based on https://github.com/knalli/sourcetree-custom-actions/blob/master/Github/Open_commit_on_Github.sh
# Opens the Stash page for the current git commit

source $(dirname $0)/stash_base.sh

open "$(stash_base_url)/browse"
