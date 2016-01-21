# Usage: ra init
# Summary: Initialize profile environment

# Source console profile
$files = Get-ChildItem $psscriptroot\..\console\*.ps1
ForEach ($file in $files) {
  & ($file.fullName)
}

# Source straps profile
if (Test-Path $devstrap_ra_profile) {
  $files = Get-ChildItem $devstrap_ra_profile\*.ps1
  ForEach ($file in $files) {
    & ($file.fullName)
  }
}
