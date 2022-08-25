#!/bin/sh

echo "Sentry CLI cheat sheet"
echo ""
echo "sentry-cli releases new $VERSION // Create a new release"
echo "sentry-cli releases finalize $VERSION // Finalize a release. Done after finished building the release"
echo "sentry-cli releases set-commits $VERSION --auto // Set automatically commits to release" 
echo "sentry-cli releases deploys $VERSION new -e prod // Create a new deploy linked to a release" 
echo "npm version patch // Update patch version of package.json" 
echo "export SENTRY_ORG=my-org // Export org slug so you don't have to pass it as param"
echo "export SENTRY_PROJECT=my-project // Export project slug so you don't have to pass it as param"
echo "You can also set the org and project options in ~/.sentryclirc"