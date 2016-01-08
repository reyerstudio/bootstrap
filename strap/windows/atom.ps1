#requires -v 3

# Remote install
# $ ra strap atom
$erroractionpreference = 'stop' # quit if anything goes wrong

"Installing atom environment..."

# Install atom
install_or_update atom
create_shortcut "Atom" $(scoop which atom)
