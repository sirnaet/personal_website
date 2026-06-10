#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

echo "Building Flutter web..."
flutter build web

echo "Building React portfolio..."
cd react-portfolio
npm install
npm run build

echo "Build complete."
