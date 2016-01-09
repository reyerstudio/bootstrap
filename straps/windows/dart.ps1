#requires -v 3

# Remote install
# $ ra strap dart
$erroractionpreference = 'stop' # quit if anything goes wrong

$dart_path = "~/.pub-cache/bin"

function strapping() {
  "Strapping dart..."

  # Install dart
  install_or_update dart
  install_or_update dartium
  install_or_update dartium_content_shell
  add_to_path $dart_path

  # Configure IDE
  $dart = resolve-path $(dirname $(dirname $(which dart)))
  $dartium = resolve-path $(scoop which dartium)
  $cs = resolve-path $(scoop which content_shell)
  ""
  "Installation directories are following"
  "- Dart SDK      = '$dart'"
  "- Dartium       = '$dartium'"
  "- Content Shell = '$cs'"
}

function unstrapping() {
  "Unstrapping dart..."
  scoop uninstall dart
  scoop uninstall dartium
  scoop uninstall dartium_content_shell
  remove_from_path $dart_path
}

& $action