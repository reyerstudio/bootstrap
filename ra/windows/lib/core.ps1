$devstrap = $env:DEVSTRAP_NAME, "devstrap" | select -first 1

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
      & (Resolve-Path $path) $action
    } else {
      "Downloading $url/straps/windows/$target.ps1"
      $script = (new-object net.webclient).downloadstring("$url/straps/windows/$target.ps1")
      Invoke-Command -Script { Invoke-Expression $script } -Args $action
    }
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
