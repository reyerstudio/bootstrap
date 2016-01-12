# Usage: ra help <command>
# Summary: Show help for a command
CMD=$1

function extract_usage() {
  local TEXT=$(cat $1 | grep '^# Usage: ')
  local REGEX='^# Usage: (.*)$'
  [[ $TEXT =~ $REGEX ]]
  echo "Usage: ${BASH_REMATCH[1]}"
}

function extract_summary() {
  local TEXT=$(cat $1 | grep '^# Summary: ')
  local REGEX='^# Summary: (.*)$'
  [[ $TEXT =~ $REGEX ]]
  echo "${BASH_REMATCH[1]}"
}

function extract_help() {
  local FILE=$1
  awk '
    /^# Help: .*/ { flag=1; }
    /^[^#]/     { flag=0; }
    flag        { print; }
  ' $FILE | sed s/^#\ Help:\ // | sed s/^#\ //g
}

function print_help() {
  local FILE
  if [ -f "$LIBEXECDIR/$CMD.sh" ]; then
    FILE="$LIBEXECDIR/$CMD.sh"
  else
    FILE="$DEVSTRAP_RA_LIBEXEC/$CMD.sh"
  fi

  local USAGE=$(extract_usage $FILE)
  local SUMMARY=$(extract_summary $FILE)
  local HELP=$(extract_help $FILE)

  [ -z "$USAGE" ] || echo "$USAGE"
  [ -z "$HELP" ] || echo -n -e "\n$HELP"
}

function print_summaries() {
  declare -A CMDS_HELP
  local CMD
  local SIZE
  local MAX=0
  for CMD in $(find $LIBEXECDIR -name "*.sh" | xargs basename -s ".sh"); do
    CMDS_HELP[$CMD]=$(extract_summary $LIBEXECDIR/$CMD.sh)
    SIZE=${#CMD}
    if [ $SIZE -gt $MAX ]; then
      MAX=$SIZE
    fi
  done
  if [ -d $DEVSTRAP_RA_LIBEXEC ]; then
    for CMD in $(find $DEVSTRAP_RA_LIBEXEC -name "*.sh" | xargs basename -s ".sh"); do
      CMDS_HELP[$CMD]=$(extract_summary $DEVSTRAP_RA_LIBEXEC/$CMD.sh)
      SIZE=${#CMD}
      if [ $SIZE -gt $MAX ]; then
        MAX=$SIZE
      fi
    done
  fi

  MAX=$((MAX + 1))
  local SORTED_CMDS=$(echo $COMMANDS | sort)
  for CMD in $(echo $COMMANDS | sort); do
    printf "%-${MAX}s %s\n" $CMD "${CMDS_HELP[$CMD]}"
  done
}

if [ -z "$CMD" ]; then
  echo "usage: ra <command> [<args]"
  echo "Some useful commands are:"
  echo
  print_summaries
  echo
  echo "type 'ra help <command>' to get help for a specific command"
elif [[ "$COMMANDS" =~ "$CMD" ]]; then
  print_help $cmd
else
  echo "ra help: no such command '$CMD'"
  exit 1
fi

exit 0
