SOURCE_DIR=$(BUILD_DIR)/platforms/$(PLATFORM_NAME)
EXPORT_DIR=$(SOURCE_DIR)/bin

define platform/download
	$(call download_os)
	$(call prepare_build)
endef

define platform/compile
	# Copy over custom files
	rm -rf $(SOURCE_DIR)/files/*
	mkdir -p $(SOURCE_DIR)/files
	$(CP) -r $(TOP_DIR)/src/image/src/* $(SOURCE_DIR)/files/

	# Build Image
	$(MAKE) \
	 SDK_NAME=$(SDK_NAME) \
	 ENVIRONMENT=$(ENVIRONMENT) \
	 FORCE_UNSAFE_CONFIGURE=1 \
	 $(BUILD_FLAGS)

	 # Copy Artifacts into Bin folder
	 $(CP) -r $(EXPORT_DIR)/* $(PLATFORM_DIR)
endef
