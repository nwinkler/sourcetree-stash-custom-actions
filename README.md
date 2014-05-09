# sourcetree-stash-custom-actions


Custom Actions for working with Stash from SourceTree.

These are currently only supported on Mac OS X. Windows batch files with similar functionality still need to be created.

## Provided Functionality
The custom actions provided in this repository help with automating some actions when working with repositories hosted on Stash in SourceTree. The main work done here is to translate the URLs used by Stash for the Git endpoint to URLs that work with the Stash web UI.

An example:

* Source URL used by Git and SourceTree internally: https://127.0.0.1/git/scm/foo-project/repo-name.git
* Target URL for the same repo in the Stash web UI: https://127.0.0.1/git/projects/foo-project/repos/repo-name

The custom action scripts in this repo translate the URLs and allow you to go from a local commit directly to the same commit in the web UI.

### Copy Stash Commit URL
This custom action copies the URL of the currently selected commit to the system clipboard, allowing you to paste the URL into an email, a ticket description, or some other place.

### Open Stash Commit URL
This custom action opens the currently selected commit in your system's default web browser.

## Limitations
The custom actions currently have the following limitations:

* They only work on Mac OS X. The scripts are written using _Bash_, but make use of some OS-specific functions, e.g. the `pbcopy` command for copying to the system clipboard, or the `open` command for opening a URL in the default web browser.
* They only work for project repos, not for user repos.
* They only work for remotes called `origin`.
* Error handling is only rudimentary. In case of an error in the _Copy Stash Commit URL_ command, the error message is copied to the system clipboard.
* No automated installation script


## Installation

The first step is to clone this repo to your local machine, then follow the instructions per operating system.

### Mac OS X

There's no automated way to install these in SourceTree, since the SourceTree configuration for the custom actions is kept in `~/Library/Application Support/SourceTree/actions.plist`.

To install the custom actions manually, open the SourceTree preferences (_SourceTree > Preferences_) and switch to the _Custom Actions_ tab. There, add the following custom commands:

* Copy Stash Commit URL:
	* _Menu Caption_: "Copy Stash Commit URL"
	* _Script to run_: Point it to the `Stash/copy_commit_url_osx.sh` script from this repo
	* _Parameters_: "$SHA"
* Open Stash Commit URL:
	* _Menu Caption_: "Open Stash Commit URL"
	* _Script to run_: Point it to the `Stash/open_commit_on_stash.sh` script from this repo
	* _Parameters_: "$SHA"

## Usage

To use these custom actions after installation, simply select a commit in a project hosted on Stash, right-click on the commit, then open the _Custom Actions_ item from the context menu and select one of the custom actions.

## To Do
* Support for user repositories
* Support for Windows
* Unit tests


## LICENSE

This projected is licensed under the terms of the MIT license.
