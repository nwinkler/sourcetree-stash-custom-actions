#!/bin/bash

# Based on https://github.com/knalli/sourcetree-custom-actions/blob/master/Github/Open_commit_on_Github.sh
# Converts the origin URL (git endpoint) to the project URL on Stash
# Source format: https://domain.com/git/scm/foo-project/repo-name.git
# Target format: https://domain.com/git/projects/foo-project/repos/repo-name

function stash_base_url() {
  local giturl=$(git config --get remote.origin.url)

  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi


  re='(.*)/scm/(.*)/(.*)\.git'

  if [[ $giturl =~ $re ]]
  then
    giturl=${BASH_REMATCH[1]}/projects/${BASH_REMATCH[2]}/repos/${BASH_REMATCH[3]}

    echo $giturl
  else
    echo "Git URL does not match: $giturl"
    exit 1;
  fi
}
