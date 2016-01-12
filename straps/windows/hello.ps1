#requires -v 3
param($action)
$erroractionpreference = 'stop' # quit if anything goes wrong

echo "Hello $action"
