function command_files {
  gci ("$psscriptroot\..\libexec") | where { $_.name.endswith('.ps1') }
}

function devstrap_command_files {
  if (test-path $devstrap_ra_libexec) {
    gci ($devstrap_ra_libexec) | where { $_.name.endswith('.ps1') }
  }
}

function commands {
  command_files | % { command_name $_ }
  devstrap_command_files | % { command_name $_ }
}

function command_name($filename) {
  $filename.name -replace '\.ps1$', ''
}

function exec($cmd, $arguments) {
  if (test-path "$psscriptroot\..\libexec\$cmd.ps1") {
    & ("$psscriptroot\..\libexec\$cmd.ps1") @arguments
  }
  if (test-path "$devstrap_ra_libexec\$cmd.ps1") {
    & ("$devstrap_ra_libexec\$cmd.ps1") @arguments
  }
}
