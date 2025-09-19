#!/bin/zsh
# 🧹 Cleanup Script for TLP-Integrator
# Removes stale or duplicate seed and zip files

echo "🧽 Starting cleanup..."

# Delete old bundles
rm -rf ./TLP-Integrator-seed-bundle
rm -f ./TLP-Integrator-seed-bundle.zip
rm -f ./TLP-Integrator.zip

# Confirm files that remain
echo "✅ Cleanup complete. Remaining top-level structure:"
command -v tree >/dev/null || brew install tree
tree -L 2

echo "🧼 Done!"
