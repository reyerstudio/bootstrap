﻿#requires -v 3

$masterUrl="https://raw.githubusercontent.com/reyerstudio/devstrap/master"
$archiveUrl="https://github.com/reyerstudio/devstrap/archive"

function update($name) {
  $json = (new-object net.webclient).DownloadString("$masterUrl/$name.json") | ConvertFrom-JSON
  $lastVersion=$json.version
  $a = @($lastVersion -Split '\.')
  $a[2] = ([int]$a[2])+1
  $version="$($a[0]).$($a[1]).$($a[2])"
  $manifest="$PSScriptRoot\..\$name.json"
  $formulae="$PSScriptRoot\..\$name.rb"

  $lastSHA=$(git rev-parse origin/master)
  (new-object net.webclient).DownloadFile("$archiveUrl/$lastSHA.zip", "$env:Temp\$lastSHA.zip")
  $shasum = @($(shasum -a 256 "$env:Temp\$lastSHA.zip") -Split " ")[0]
  $json.version = $version
  $json.url = "$archiveUrl/$lastSHA.zip"
  $json.extract_dir = "devstrap-$lastSHA\ra\windows"
  $json.hash = $shasum
  $json | ConvertTo-Json | Out-File $manifest -Encoding UTF8

  "class Ra < Formula
    desc `"Bootstrapping development environment`"
    version `"$version`"
    url `"$archiveUrl/$lastSHA.zip`"
    sha256 `"$shasum`"

    bottle :unneeded

    def install
      bin.install    `"ra/unix/bin/ra`"
      prefix.install Dir[`"ra/unix/func`"]
      prefix.install Dir[`"ra/unix/libexec`"]
      prefix.install Dir[`"ra/unix/console`"]
    end
  end" | Out-File $formulae -Encoding UTF8

  git add $manifest
  git commit -m "$name $version"
  git push origin master
}

update ra
