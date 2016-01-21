$devstrap = $env:DEVSTRAP_NAME, "devstrap" | select -first 1
$devstrap_home = "~\$devstrap"
$devstrap_ra_profile = "$env:LocalAppData\$devstrap\ra\profile.d"
$devstrap_ra_libexec = "$env:LocalAppData\$devstrap\ra\libexec"

function install_or_update($app) {
  if (installed $app) {
    scoop update $app -q
  } else {
    scoop install $app
  }
}

function npm_install_or_upgrade($name) {
  "Install or upgrade $name"
  if (npm_is_installed($name)) {
    if (npm_is_upgradable($name)) {
      npm update -g "$name"
    }
  } else {
    npm install -g "$name"
  }
}

function npm_is_installed($name) {
  npm -j list -g --depth=0 $name > $null
  return $?
}

function npm_is_upgradable($name) {
  npm -j outdated -g "$name" > $null
  return $?
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

function install_ra_init($name, $script) {
  ensure "$devstrap_ra_profile" > $null
  $script | Out-File "$devstrap_ra_profile\$name.ps1" -Encoding UTF8
}

function uninstall_ra_init($name) {
  rm "$devstrap_ra_profile\$name.ps1"
}

function install_ssh_config($name, $config) {
  ensure "$env:LocalAppData\$devstrap\ssh\config.d" > $null
  $config | Out-File "$env:LocalAppData\$devstrap\ssh\config.d\$name" -Encoding ASCII
  _build_ssh_config
}

function uninstall_ssh_config($name) {
  rm "$env:LocalAppData\$devstrap\ssh\config.d\$name"
  _build_ssh_config
}

function _build_ssh_config() {
  if (Test-Path $env:LocalAppData\$devstrap\ssh\config.d) {
    $files = Get-ChildItem $env:LocalAppData\$devstrap\ssh\config.d\*
    If (Test-Path ~\.ssh\config) {
      rm ~\.ssh\config
    }
    ForEach ($file in $files) {
      Get-Content -Path $file.fullName | Out-File ~\.ssh\config -Encoding ASCII -Append
    }
  }
}

function install_ssh_known_hosts($name, $config) {
  ensure "$env:LocalAppData\$devstrap\ssh\known_hosts.d" > $null
  $config | Out-File "$env:LocalAppData\$devstrap\ssh\known_hosts.d\$name" -Encoding ASCII
  _build_ssh_known_hosts
}

function uninstall_ssh_known_hosts($name) {
  rm "$env:LocalAppData\$devstrap\ssh\known_hosts.d\$name"
  _build_ssh_known_hosts
}

function _build_ssh_known_hosts() {
  if (Test-Path $env:LocalAppData\$devstrap\ssh\known_hosts.d) {
    $files = Get-ChildItem $env:LocalAppData\$devstrap\ssh\known_hosts.d\*
    If (Test-Path ~\.ssh\known_hosts) {
      rm ~\.ssh\known_hosts
    }
    ForEach ($file in $files) {
      Get-Content -Path $file.fullName | Out-File ~\.ssh\known_hosts -Encoding ASCII -Append
    }
  }
}

function download($name, $url) {
  $file = "$($env:Temp)\$name"
  curl -L -o $file $url
  return $file
}
