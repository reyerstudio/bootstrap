case $(uname -s) in
  "Darwin")
    source $(brew --prefix)/bin/ra init
    ;;
  "Linux")
    source ~/.linuxbrew/bin/ra init
    ;;
esac
