# Usage: ra upgrade [app]
# Summary: Upgrade apps
# Help: 'ra upgrade' upgrades all apps to the latest version.
# 'ra upgrade <app>' upgrades the latest version of that app, if there is one.
param($app)

if ($app -eq $null) {
  scoop update *
} else {
  scoop update $app
}
