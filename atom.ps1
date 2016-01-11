#requires -v 3
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

function strapping() {
  "Strapping atom..."
  install_or_update atom
  create_shortcut "Atom" $(scoop which atom)
}

function unstrapping() {
  "Unstrapping atom..."
  scoop uninstall atom
  delete_shortcut "Atom"
}
echo "Action = $action"
Invoke-Expression "$action"
