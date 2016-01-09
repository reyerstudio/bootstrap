# Usage: ra strap [target]
# Summary: Strapping 'target' environment
# Help: Strapping procedure for installing 'target' environment
param($target)

$strap_base_url='https://raw.githubusercontent.com/reyerstudio/devstrap/master'

strap_action 'strapping' $strap_base_url $target
