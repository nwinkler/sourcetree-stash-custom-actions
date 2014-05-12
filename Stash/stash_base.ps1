param(
[string]$a
)
# The first parameter of this script is assigned to the $a variable.

# Use PowerShell RegEx to change the URL and get rid of the '.git' part
$a -replace "(.*)/scm/(.*)/(.*)\.git", '$1/projects/$2/repos/$3'
