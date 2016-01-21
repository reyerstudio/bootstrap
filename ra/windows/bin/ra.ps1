#requires -v 3
param($cmd)

$scoopdir = $env:SCOOP, "~\appdata\local\scoop" | select -first 1
. "$scoopdir\apps\scoop\current\lib\core.ps1"
. "$psscriptroot\..\lib\core.ps1"
. "$psscriptroot\..\lib\commands.ps1"

$commands = commands

if (@($null, '-h', '--help') -contains $cmd) {
  exec 'help' $args
} elseif ($cmd -eq 'init') {
  & ("$psscriptroot\..\lib\init.ps1")
} elseif ($commands -contains $cmd) {
  exec $cmd $args
} else {
  "ra: '$cmd' isn't a ra command. See 'ra help'"
  exit 1
}

exit 0