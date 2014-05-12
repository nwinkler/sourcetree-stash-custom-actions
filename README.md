# sourcetree-stash-custom-actions
Custom Actions for working with Stash from SourceTree.

These are currently supported on Mac OS X and Windows.

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

### Open Project on Stash
This custom action opens the currently selected project in your system's default web browser.

## Limitations
The custom actions currently have the following limitations:

* They only work for remotes called `origin`.
* For _remote URLs_ containing the user name in the URL (e.g. http://first.last@server/...), the Windows `start` command will fail opening the URL in the browser.
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
	* _Script to run_: Point it to the `Stash/open_commit_on_stash_osx.sh` script from this repo
	* _Parameters_: "$SHA"
* Open Project on Stash:
	* _Menu Caption_: "Open Project on Stash"
	* _Script to run_: Point it to the `Stash/open_project_on_stash_osx.sh` script from this repo
	* _Parameters_: _(leave empty)_
	
### Windows
There's no automated way to install these in SourceTree.

To install the custom actions manually, open the SourceTree options (_Tools > Options_) and switch to the _Custom Actions_ tab. There, add the following custom commands:

* Copy Stash Commit URL:
	* _Menu Caption_: "Copy Stash Commit URL"
	* _Script to run_: Point it to the `Stash\copy_commit_url_windows.bat` script from this repo
	* _Parameters_: "$SHA"
* Open Stash Commit URL:
	* _Menu Caption_: "Open Stash Commit URL"
	* _Script to run_: Point it to the `Stash\open_commit_on_stash_windows.bat` script from this repo
	* _Parameters_: "$SHA"
* Open Project on Stash:
	* _Menu Caption_: "Open Project on Stash"
	* _Script to run_: Point it to the `Stash\open_project_on_stash_windows.bat` script from this repo
	* _Parameters_: _(leave empty)_

## Usage
SourceTree is smart enough to show the appropriate custom actions based on the currently selected context and the expected parameters for the custom action. A custom action that has the _$SHA_ parameter appears when clicking on a commit in the SourceTree UI, etc.

To use these custom actions after installation, simply select a commit in a project hosted on Stash, right-click on the commit, then open the _Custom Actions_ item from the context menu and select one of the custom actions.

The _Open Project on Stash_ is not a commit/hash-based action. A commit's context menu still allows to run this custom action from the _Custom Actions > Repository Actions_ context menu (Mac OS X only). On Windows, the repository-based actions can be found in the _Custom Actions_ context menu, below the separator.

The custom actions are also available from the _Actions > Custom Actions_ menu.

## Additional Information
For more information on SourceTree's support for _custom actions_, please refer to the following:

* http://blog.sourcetreeapp.com/2012/02/08/custom-actions-more-power-to-you/
* http://blog.sourcetreeapp.com/2013/10/29/sourcetree-for-windows-1-3-released/

## To Do
* Unit tests

## Contributing
Contributions are always welcome. Simply fork this repo, hack away and create a pull request. The examples in the _Stash_ subdirectory give a good overview of how to handle the Stash URLs.

## LICENSE
This project is licensed under the terms of the MIT license.
