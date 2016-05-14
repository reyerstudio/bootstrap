#requires -v 3
# Extracted from https://chocolatey.org/packages/WebStorm
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

$localApplicationData = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::LocalApplicationData))
$WebstormVersion = "2016.1.2"

function strapping() {
  "Strapping webstorm..."
  $exe = download webstorm-windows.exe http://download.jetbrains.com/webstorm/WebStorm-${WebstormVersion}.exe
  "Launching $exe..."
  Start-Process -FilePath $exe -Wait
  rm $exe
}

function unstrapping() {
  "Unstrapping webstorm..."
  $extractionPath = (${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0]
  $installDir = Join-Path $extractionPath 'JetBrains'
  $uninstallExe = (gci "${installDir}/WebStorm ${WebstormVersion}/bin/uninstall.exe").FullName | sort -Descending | Select -first 1
  Start-Process -FilePath $uninstallExe -ArgumentList "--uninstall" -Wait
}

Invoke-Expression "$action"
