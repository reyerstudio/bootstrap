#requires -v 3

# Remote install
# $ ra strap console
$erroractionpreference = 'stop' # quit if anything goes wrong

"Installing console environment..."
install_or_update concfg
sudo concfg import -n solarized small
install_or_update pshazz
