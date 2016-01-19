# Usage: ra profile [devstrap_name]
# Summary: Install profile environment
param($name)

if (!$name -eq $null) {
  set_env DEVSTRAP_NAME $name
}
