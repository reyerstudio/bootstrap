#requires -v 3

$erroractionpreference = 'stop' # quit if anything goes wrong

$name = split-path (whoami) -leaf
"Hello, world! you're logged as $name"
