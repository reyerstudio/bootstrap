#requires -v 3
# Extracted from https://chocolatey.org/packages/WebStorm
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

$localApplicationData = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::LocalApplicationData))

function strapping() {
  "Strapping atom..."
  $exe = download webstorm-windows.exe http://download.jetbrains.com/webstorm/WebStorm-11.0.3.exe
  "Launching $exe..."
  Start-Process -FilePath $exe -ArgumentList "/S" -Wait
  rm $exe
}

function unstrapping() {
  "Unstrapping atom..."
  $extractionPath = (${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0]
  $installDir = Join-Path $extractionPath 'JetBrains'
  $uninstallExe = (gci "${installDir}/WebStorm 11.0/bin/uninstall.exe").FullName | sort -Descending | Select -first 1
  Start-Process -FilePath $uninstallExe -ArgumentList "--uninstall" -Wait
}

Invoke-Expression "$action"
