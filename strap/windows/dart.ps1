#requires -v 3

# Remote install
# $ ra strap dart
$erroractionpreference = 'stop' # quit if anything goes wrong

"Installing dart environment..."

# Install dart
install_or_update dart
install_or_update dartium
install_or_update dartium_content_shell

# Configure IDE
which dart
which dartium
which dartium_content_shell
