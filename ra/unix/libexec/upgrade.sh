# Usage: ra upgrade [app]
# Summary: Upgrade apps
# Help: 'ra upgrade' upgrades all apps to the latest version.
# 'ra upgrade <app>' upgrades the latest version of that app, if there is one.
local APP=$1

if [ -z "$APP" ]; then
  brew upgrade
else
  brew upgrade $APP
fi
