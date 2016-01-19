#requires -v 3
# Extracted from https://chocolatey.org/packages/android-sdk
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

function strapping() {
  "Strapping android..."
  $exe = download android-installer.exe http://dl.google.com/android/installer_r24.4.1-windows.exe
  "Launching $exe..."
  Start-Process -FilePath $exe -Wait
  rm $exe
}

function unstrapping() {
  "Unstrapping android..."
  $uninstallExe = "${Env:LOCALAPPDATA}\Android\android-sdk\uninstall.exe"
  Start-Process -FilePath $uninstallExe -Wait
}

Invoke-Expression "$action"
