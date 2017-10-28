# targets.mk
#
# Declares the build targets
#

download/%:
	@echo "Downloading Source For $*..."

	$(call configure_platform)
	$(call platform/download)

platform/%:
	@echo "Building Development Platform For $*..."
	
	$(call configure_platform)
	$(call platform/download)
	$(call platform/compile)

clean:
	@echo "Cleaning..."
	rm -rf $(BUILD_DIR)