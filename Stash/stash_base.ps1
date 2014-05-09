param(
[string]$a
)

$a -replace "(.*)/scm/(.*)/(.*)\.git", '$1/projects/$2/repos/$3'
