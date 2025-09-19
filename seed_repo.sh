#!/bin/zsh
# 📦 Idempotent Repo Seeder for TLP-Integrator

echo "🧪 Bootstrapping: TLP-Integrator"

# Create only if missing
mkdir -p ./intel ./docs ./scripts ./src ./playbooks ./data ./bin

# Safe-create marker files
touch ./README.md ./intel/.keep ./docs/.keep

echo "✅ Folder structure created (idempotent)"
