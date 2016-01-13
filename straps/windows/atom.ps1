#requires -v 3
# Extracted from https://chocolatey.org/packages/atom
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

$localApplicationData = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::LocalApplicationData))

function strapping() {
  "Strapping atom..."
  $exe = download atom-windows.exe https://atom.io/download/windows
  "Launching $exe..."
  Start-Process -FilePath $exe -ArgumentList "--silent" -Wait
  $atomFolder = Join-Path $localApplicationData "atom"
  add_to_path "$atomFolder\bin"
  rm $exe
}

function unstrapping() {
  "Unstrapping atom..."
  $atomFolder = Join-Path $localApplicationData "atom"
  $updateExe = Join-Path $atomFolder "Update.exe"
  Start-Process -FilePath $updateExe -ArgumentList "--uninstall" -Wait
  remove_from_path "$atomFolder\bin"
}

Invoke-Expression "$action"
