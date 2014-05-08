#!/bin/bash

source $(dirname $0)/stash_base.sh

echo "$(stash_base_url)/commits/$1" | pbcopy
