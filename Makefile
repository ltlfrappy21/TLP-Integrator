# 📦 TLP-Integrator Makefile

REPO_NAME := TLP-Integrator
SEED_SCRIPT := seed_repo.sh
ZIP_NAME := $(REPO_NAME)-v0.1.1.zip

.PHONY: seed zip clean push

seed:
	@echo "🔧 Running seeder..."
	chmod +x ./$(SEED_SCRIPT)
	./$(SEED_SCRIPT)

zip:
	@echo "📦 Packaging project..."
	zip -r $(ZIP_NAME) . -x "*.git*" "*.DS_Store*" "__MACOSX"

clean:
	@echo "🧹 Cleaning up..."
	rm -f $(ZIP_NAME)

push:
	@echo "🚀 Committing and pushing to GitHub..."
	git add .
	git commit -m "🔁 Auto-push from Makefile"
	git push origin main

prune:
	@echo "🧹 Pruning repo (deleting old zips and seed bundles)..."
	@rm -rf ./TLP-Integrator-seed-bundle ./TLP-Integrator.zip ./TLP-Integrator-seed-bundle.zip
	@echo "✅ Done. Repo is clean."
