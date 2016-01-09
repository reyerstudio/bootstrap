#!/usr/bin/env bash -x

SCRIPTDIR=$(dirname $0)
MASTER_URL="https://raw.githubusercontent.com/reyerstudio/devstrap/master"
ARCHIVE_URL="https://github.com/reyerstudio/devstrap/archive"

update_manifest() {
  local NAME=$1
  LAST_VERSION=$(curl -sL $MASTER_URL/$NAME.json | jq -r .version)
  a=( ${LAST_VERSION//./ } )
  ((a[2]++))
  VERSION="${a[0]}.${a[1]}.${a[2]}"
  MANIFEST=$SCRIPTDIR/../$NAME.json

  LAST_SHA=$(git rev-parse origin/master)
  SHASUM=$(curl -sL $ARCHIVE_URL/$LAST_SHA.zip | shasum -a 256 - | cut -d' ' -f1)
  cat <<END > $MANIFEST
{
  "version": "$VERSION",
  "url": "https://github.com/reyerstudio/devstrap/archive/$LAST_SHA.zip",
  "extract_dir": "devstrap-$LAST_SHA\\\\ra\\\\windows",
  "hash": "$SHASUM",
  "bin": [ "bin\\\\ra.ps1" ]
}
END
  git add $MANIFEST
  git commit -m "$NAME $VERSION"
  git push origin master
}

update_manifest ra
