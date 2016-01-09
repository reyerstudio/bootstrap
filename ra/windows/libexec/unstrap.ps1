# Usage: ra unstrap [target]
# Summary: Unstrapping 'target' environment
# Help: Unstrapping procedure for removing 'target' environment
param($target)

$strap_base_url='https://raw.githubusercontent.com/reyerstudio/devstrap/master'

strap_action 'unstrapping' $strap_base_url $target
