@ECHO OFF
SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%stash_base.ps1

rem Ugly hack to set the GitUrl variable from the command output
for /f "delims=" %%i in ('git config --get remote.origin.url') do set GitUrl=%%i

rem Run PowerShell with the provided Git URL, output the result to stdout
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& '%PowerShellScriptPath%' '%GitUrl%'";
