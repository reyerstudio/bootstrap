#requires -v 3

$masterUrl="https://raw.githubusercontent.com/reyerstudio/devstrap/master"
$archiveUrl="https://github.com/reyerstudio/devstrap/archive"

function update_manifest($name) {
  $json = (new-object net.webclient).DownloadString("$masterUrl/$name.json") | ConvertFrom-JSON
  $lastVersion=$json.version
  $a = @($lastVersion -Split '\.')
  $a[2] = ([int]$a[2])+1
  $version="$($a[0]).$($a[1]).$($a[2])"
  $manifest="$PSScriptRoot\..\$name.json"

  $lastSHA=$(git rev-parse origin/master)
  (new-object net.webclient).DownloadFile("$archiveUrl/$lastSHA.zip", "$env:Temp\$lastSHA.zip")
  $shasum = @($(shasum -a 256 "$env:Temp\$lastSHA.zip") -Split " ")[0]
  $json.version = $version
  $json.url = "$archiveUrl/$lastSHA.zip"
  $json.extract_dir = "devstrap-$lastSHA\ra\windows"
  $json.hash = $shasum
  $json | ConvertTo-Json | Out-File $manifest -Encoding UTF8
  git add $manifest
  git commit -m "$name $version"
  git push origin master
}

update_manifest ra