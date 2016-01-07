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
$dart = resolve-path $(dirname $(dirname $(which dart)))
$dartium = resolve-path $(scoop which dartium)
$cs = resolve-path $(scoop which content_shell)
""
"Installation directories are following"
"- Dart SDK      = '$dart'"
"- Dartium       = '$dartium'"
"- Content Shell = '$cs'"
