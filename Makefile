include ./manifest.mk

# Directories
export TOP_DIR:=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
export BIN_DIR=$(TOP_DIR)/bin
export BUILD_DIR=/home/vagrant/build_dir
export CONFIG_DIR=$(TOP_DIR)/makefiles/configs
export FEED_DIR=$(BUILD_DIR)/feed
export PACKAGE_SRC=$(FEED_DIR)/$(PACKAGE_NAME)
export PLATFORM_DIR=$(BIN_DIR)/$(PLATFORM_PATH)

# Files
export SHARED_CONFIG_FILE=$(CONFIG_DIR)/Shared.config
export PLATFORM_CONFIG_DIR=$(CONFIG_DIR)/$(PLATFORM_NAME).config

# Commands
export CP = sudo cp
export FEEDS=cd $(SOURCE_DIR) && sudo ./scripts/feeds
export MAKE=cd $(SOURCE_DIR) && sudo make

# Constants
export FEED_NAME=me
export PACKAGE_NAME=my-package
export PACKAGE_CATEGORY=me
export SDK_NAME=SDK

# Imports information for the current platform
define configure_platform
	$(eval include makefiles/platforms/$*.mk)
	$(eval $(platform/$*/meta))
endef

# Downloads the source code for the OS, applies any patches and custom feeds
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
	cat $(PLATFORM_CONFIG_DIR) >> /tmp/$(PLATFORM_NAME).config
	echo "\n" >> /tmp/$(PLATFORM_NAME).config
	cat $(SHARED_CONFIG_FILE) >> /tmp/$(PLATFORM_NAME).config

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

# Targets
download/%:
	@echo "Downloading Source For $*..."

	$(eval include makefiles/platform.mk)
	$(call configure_platform)
	$(call platform/download)

platform/%:
	@echo "Building Development Platform For $*..."
	
	$(eval include makefiles/platform.mk)
	$(call configure_platform)
	$(call platform/download)
	$(call platform/compile)

clean:
	@echo "Cleaning..."
	rm -rf $(BUILD_DIR)
	