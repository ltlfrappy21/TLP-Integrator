#!/bin/zsh

set -e

REPO_NAME="TLP-Integrator"
REPO_PATH="$HOME/Code/$REPO_NAME"
GITHUB_USER="ltlfrappy21"

echo "🧪 Bootstrapping: $REPO_NAME"

mkdir -p "$REPO_PATH"
cd "$REPO_PATH" || exit 1

if [ ! -d ".git" ]; then
  git init
  echo "✅ Git repo initialized."
else
  echo "🔁 Git already initialized."
fi

current_branch=$(git symbolic-ref --short HEAD 2>/dev/null || echo "")
if [[ "$current_branch" != "main" ]]; then
  git branch -m main 2>/dev/null || echo "⚠️ Could not rename branch (maybe already 'main')"
fi

ZIP_FILE="$REPO_PATH/$REPO_NAME.zip"
if [[ -f "$ZIP_FILE" ]]; then
  echo "📦 Unzipping archive..."
  unzip -o "$ZIP_FILE"
else
  echo "⚠️ No zip file found at $ZIP_FILE"
fi

if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  git add .
  git commit -m "Initial commit: $REPO_NAME scaffolding with Notion, Hive, Cortex, OIDC"
  echo "✅ Initial commit created"
else
  echo "🔁 Commit already exists"
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "🔗 Creating GitHub repo..."
  gh repo create "$GITHUB_USER/$REPO_NAME" --public --source=. --remote=origin
else
  echo "🔁 GitHub remote already set"
fi

if ! git ls-remote --exit-code origin main >/dev/null 2>&1; then
  git push -u origin main
  echo "🚀 Code pushed to GitHub"
else
  echo "🔁 Code already pushed"
fi

echo "🎉 Done. View repo: https://github.com/$GITHUB_USER/$REPO_NAME"
