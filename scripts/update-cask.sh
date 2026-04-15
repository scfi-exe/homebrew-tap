#!/bin/bash
# Updates the DropShot Homebrew cask with a new version and SHA256.
#
# Computes the SHA256 of the supplied .dmg, rewrites the version and sha256
# fields in Casks/dropshot.rb, and commits the change locally. Does NOT push —
# that step is left to the developer so they can inspect the diff first.
#
# Usage:
#   ./scripts/update-cask.sh <version> <path-to-dmg>
#
# Example:
#   ./scripts/update-cask.sh 1.1 ../build/DropShot-1.1.dmg

set -euo pipefail

if [ $# -ne 2 ]; then
    echo "Usage: $0 <version> <path-to-dmg>"
    echo "Example: $0 1.1 ../build/DropShot-1.1.dmg"
    exit 1
fi

VERSION="$1"
DMG_PATH="$2"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TAP_DIR="$(dirname "$SCRIPT_DIR")"
CASK_FILE="$TAP_DIR/Casks/dropshot.rb"

if [ ! -f "$DMG_PATH" ]; then
    echo "Error: DMG not found at $DMG_PATH"
    exit 1
fi

if [ ! -f "$CASK_FILE" ]; then
    echo "Error: Cask file not found at $CASK_FILE"
    exit 1
fi

# Compute SHA256
SHA256=$(shasum -a 256 "$DMG_PATH" | awk '{print $1}')
echo "Version: $VERSION"
echo "SHA256:  $SHA256"

# Update version and sha256 in the cask file
sed -i '' "s/^  version \".*\"/  version \"$VERSION\"/" "$CASK_FILE"
sed -i '' "s/^  sha256 \".*\"/  sha256 \"$SHA256\"/" "$CASK_FILE"

echo "Updated $CASK_FILE"

# Commit locally — do not push.
cd "$TAP_DIR"
git add Casks/dropshot.rb
git commit -m "Update DropShot to ${VERSION}"

echo ""
echo "Committed cask update for DropShot ${VERSION}."
echo "Reminder: push to scfi-exe/homebrew-tap when ready:"
echo "  cd $TAP_DIR && git push origin main"
