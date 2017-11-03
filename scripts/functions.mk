# targets.mk
#
# Declares the shared functions
#

# Download Steps For Platform
define platform/download
	$(call download_os)
	$(call prepare_build)
endef

# Compile Platform
define platform/compile
	# Copy over custom files
	rm -rf $(SOURCE_DIR)/files/*
	mkdir -p $(SOURCE_DIR)/files
	$(CP) -r $(TOP_DIR)/src/image/src/* $(SOURCE_DIR)/files/

	# Build Image
	$(MAKE) \
	 ENVIRONMENT=$(ENVIRONMENT) \
	 FORCE_UNSAFE_CONFIGURE=1 \
	 $(BUILD_FLAGS)

	 # Copy Artifacts into Bin folder
	 $(CP) -r $(EXPORT_DIR)/* $(PLATFORM_DIR)
endef

# Imports information for the current platform
define configure_platform
	$(eval include platforms/$*.mk)
	$(eval $(platform/$*/meta))
endef

# Downloads the source code for the OS, applies any patches, installs custom feeds
# and moves the manifest file ready for use
define download_os

	echo "Downloading Operating System..."

	if [ ! -d  $(SOURCE_DIR) ]; \
	then \
		git clone $(OS_SOURCE_CODE) $(SOURCE_DIR); \
		\
		mkdir -p $(SOURCE_DIR)/patches; \
		$(CP) -r $(TOP_DIR)/src/image/patches/* $(SOURCE_DIR)/patches/; \
		sudo rm $(SOURCE_DIR)/patches/series; \
		ls $(SOURCE_DIR)/patches/ > /tmp/series.new; \
		$(CP) /tmp/series.new $(SOURCE_DIR)/patches/series; \
		cd $(SOURCE_DIR) && sudo quilt push -a; \
		\
		$(CP) $(SOURCE_DIR)/feeds.conf.default $(SOURCE_DIR)/feeds.conf; \
		echo "src-link $(FEED_NAME) $(FEED_DIR)" >> $(SOURCE_DIR)/feeds.conf; \
	fi

	cd $(SOURCE_DIR) && git checkout $(OS_SOURCE_VERSION)
	cp $(TOP_DIR)/manifest.mk $(SOURCE_DIR)
endef

# Prepares the build by copying files and creating directories needed
# as well as preparing the source code for the package so the build
# system can use it
define prepare_build

	echo "Preparing Build..."

	rm -rf $(PACKAGE_SRC)
	mkdir -p $(PACKAGE_SRC)
	$(CP) -avr $(TOP_DIR)/src/package/* $(PACKAGE_SRC)

	$(FEEDS) update -a
	$(FEEDS) install $(PACKAGE_NAME)

	$(MAKE) defconfig

	cat $(SOURCE_DIR)/.config > /tmp/$(PLATFORM_NAME).config
	echo "\n" >> /tmp/$(PLATFORM_NAME).config
	cat "$(platform/$*/config)" >> /tmp/$(PLATFORM_NAME).config
	echo "\n" >> /tmp/$(PLATFORM_NAME).config
	cat "$(project/config)" >> /tmp/$(PLATFORM_NAME).config

	$(eval $(project/meta))
	$(call preprocess,/tmp/$(PLATFORM_NAME).config)
	$(CP) /tmp/$(PLATFORM_NAME).config $(SOURCE_DIR)/.config

	mkdir -p $(PLATFORM_DIR)
endef

# Takes a file and preprocesses it
define preprocess
	sudo sed -i \
	-e "s/\$${NAME}/$(NAME)/" \
	-e "s/\$${VERSION}/$(VERSION)/" \
	-e "s/\$${RELEASE}/$(RELEASE)/" \
	-e "s/\$${AUTHOR}/$(AUTHOR)/" \
	${1}
endef