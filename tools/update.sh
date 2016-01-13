#!/usr/bin/env bash -x

SCRIPTDIR=$(dirname $0)
MASTER_URL="https://raw.githubusercontent.com/reyerstudio/devstrap/master"
ARCHIVE_URL="https://github.com/reyerstudio/devstrap/archive"

update() {
  local NAME=$1
  LAST_VERSION=$(curl -sL $MASTER_URL/$NAME.json | jq -r .version)
  a=( ${LAST_VERSION//./ } )
  ((a[2]++))
  VERSION="${a[0]}.${a[1]}.${a[2]}"
  MANIFEST=$SCRIPTDIR/../$NAME.json
  FORMULAE=$SCRIPTDIR/../$NAME.rb

  LAST_SHA=$(git rev-parse origin/master)
  SHASUM=$(curl -sL $ARCHIVE_URL/$LAST_SHA.zip | shasum -a 256 - | cut -d' ' -f1)
  cat <<END_SCOOP > $MANIFEST
{
  "version": "$VERSION",
  "url": "https://github.com/reyerstudio/devstrap/archive/$LAST_SHA.zip",
  "extract_dir": "devstrap-$LAST_SHA\\\\ra\\\\windows",
  "hash": "$SHASUM",
  "bin": [ "bin\\\\ra.ps1" ]
}
END_SCOOP

  cat <<END_BREW > $FORMULAE
class Ra < Formula
  desc "Bootstrapping development environment"
  version "$VERSION"
  url "https://github.com/reyerstudio/devstrap/archive/$LAST_SHA.zip"
  sha256 "$SHASUM"

  bottle :unneeded

  def install
    bin.install    "ra/unix/bin/ra"
    prefix.install Dir["ra/unix/func"]
    prefix.install Dir["ra/unix/libexec"]
  end
end
END_BREW

  git add $MANIFEST $FORMULAE
  git commit -m "$NAME $VERSION"
  git push origin master
}

update ra
