$devstrap = $env:DEVSTRAP_NAME, "devstrap" | select -first 1
$devstrap_home = "~\$devstrap"
$devstrap_ra_libexec = "$env:LocalAppData\$devstrap\ra\libexec"

function install_or_update($app) {
  if (installed $app) {
    scoop update $app -q
  } else {
    scoop install $app
  }
}

function create_shortcut($name, $targetPath) {
  $dir = [environment]::getfolderpath("StartMenu") + "\$devstrap"
  ensure $dir > $null
  $objShell = New-Object -ComObject ("WScript.Shell")
  $objShortCut = $objShell.CreateShortcut($dir + "\$name.lnk")
  $objShortCut.TargetPath = Resolve-Path $targetPath
  $objShortCut.Save()
}

function delete_shortcut($name) {
  $path = [environment]::getfolderpath("StartMenu") + "\$devstrap\$name.lnk"
  if (test-path $path) {
    rm $path
  }
}

function strap_action($action, $url, $target) {
  if ($target -eq $null) {
    "ERROR: Missing 'target' module"
    exit 1
  } else {
    $path = $target
    if (!$path.endswith('.ps1')) {
      $path += '.ps1'
    }

    if (test-path $path) {
      "Executing local $path"
    } else {
      "Downloading $url/straps/windows/$target.ps1"
      $path = "$env:Temp/$target.ps1"
      $remote = "$url/straps/windows/$target.ps1"
      $client = New-Object System.Net.WebClient
      $client.DownloadFile($remote, $path)
    }
    Invoke-Expression "$(Resolve-Path $path) $action"
  }
}

function add_to_path($dir) {
  $dir = fullpath $dir

  # Future sessions
  $null, $currpath = strip_path (env 'path') $dir
  env 'path' $global "$currpath;$dir"

  # This session
  $null, $env:path = strip_path $env:path $dir
  $env:path = "$env:path;$dir"
}

function set_env($name, $value) {
  env $name $global $value
  sc env:\$name $value
}

function unset_env($name) {
  env $name $global $null
  if (test-path env:\$name) {
    rm env:\$name
  }
}

function install_ra_cmd($name, $script) {
  ensure "$devstrap_ra_libexec" > $null
  $script | Out-File "$devstrap_ra_libexec\$name.ps1" -Encoding UTF8
}

function uninstall_ra_cmd($name) {
  rm "$devstrap_ra_libexec\$name.ps1"
}
