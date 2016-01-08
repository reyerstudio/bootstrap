# Usage: ra strap [target]
# Summary: Bootstrapping 'target' module
# Help: Execute remote script related to given 'target'
param($target)

$strap_base_url='https://raw.github.com/reyerstudio/devstrap/master/strap/windows'

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
    iex -Command (resolve-path $path)
  } else {
    "Downloading $target"
    iex (new-object net.webclient).downloadstring("$strap_base_url/$target.ps1")
  }
}
