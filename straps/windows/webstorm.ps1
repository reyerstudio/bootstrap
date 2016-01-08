#requires -v 3

# Remote install
# $ ra strap webstorm
$erroractionpreference = 'stop' # quit if anything goes wrong

"Installing webstorm environment..."

# Install webstorm
install_or_update webstorm
create_shortcut "Jetbrains WebStorm" $(scoop which webstorm)
