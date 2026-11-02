#!/usr/bin/env bash
# Renames the Android applicationId / namespace and moves MainActivity.
# Run from the project root BEFORE registering the app in Firebase.
set -euo pipefail

NEW="${1:?usage: scripts/rename_android_package.sh <new.application.id>}"
GRADLE=android/app/build.gradle.kts

if ! [[ "$NEW" =~ ^[a-z][a-z0-9_]*(\.[a-z][a-z0-9_]*)+$ ]]; then
  echo "Invalid application ID: $NEW" >&2
  exit 1
fi

OLD=$(grep -oP 'applicationId\s*=\s*"\K[^"]+' "$GRADLE")
if [[ "$OLD" == "$NEW" ]]; then
  echo "Already using $NEW"
  exit 0
fi

OLD_DIR="android/app/src/main/kotlin/${OLD//.//}"
NEW_DIR="android/app/src/main/kotlin/${NEW//.//}"
OLD_RE="${OLD//./\\.}"

mkdir -p "$NEW_DIR"
mv "$OLD_DIR/MainActivity.kt" "$NEW_DIR/MainActivity.kt"
sed -i "s/$OLD_RE/$NEW/g" "$GRADLE" "$NEW_DIR/MainActivity.kt"
find android/app/src/main/kotlin -type d -empty -delete

echo "Renamed $OLD -> $NEW"
grep -n -E 'namespace|applicationId' "$GRADLE"
