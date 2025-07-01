#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=the-kids-app-dev \
      --out=lib/src/core/config/firebase_options_dev.dart \
      --ios-bundle-id=space.prtlab.theKidsApp.dev \
      --ios-out=ios/flavors/dev/GoogleService-Info.plist \
      --android-package-name=space.prtlab.the_kids_app.dev \
      --android-out=android/app/src/dev/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=the-kids-app-prod \
      --out=lib/src/core/config/firebase_options_prod.dart \
      --ios-bundle-id=space.prtlab.theKidsApp \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --android-package-name=space.prtlab.the_kids_app \
      --android-out=android/app/src/prod/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', or 'prod'."
    exit 1
    ;;
esac