# Makefile
#
# Change the settings below to customize your image and settings
#

##########################
#  Project Configuration #
##########################

NAME:=my-first-openwrt-project
AUTHOR:=your-name
VERSION:=1
RELEASE:=1

define project/config
	CONFIG_CCACHE=y
	CONFIG_LIBCURL_COOKIES=y
	CONFIG_LIBCURL_FILE=y
	CONFIG_LIBCURL_FTP=y
	CONFIG_LIBCURL_HTTP=y
	CONFIG_LIBCURL_MBEDTLS=y
	CONFIG_LIBCURL_NO_SMB="!"
	CONFIG_LIBCURL_PROXY=y
	CONFIG_OPENSSL_WITH_DEPRECATED=y
	CONFIG_OPENSSL_WITH_EC=y
	CONFIG_OPENSSL_WITH_NPN=y
	CONFIG_OPENSSL_WITH_PSK=y
	CONFIG_OPENSSL_WITH_SRP=y
	CONFIG_OPENVPN_openssl_ENABLE_DEF_AUTH=y
	CONFIG_OPENVPN_openssl_ENABLE_FRAGMENT=y
	CONFIG_OPENVPN_openssl_ENABLE_HTTP=y
	CONFIG_OPENVPN_openssl_ENABLE_LZ4=y
	CONFIG_OPENVPN_openssl_ENABLE_LZO=y
	CONFIG_OPENVPN_openssl_ENABLE_MULTIHOME=y
	CONFIG_OPENVPN_openssl_ENABLE_PF=y
	CONFIG_OPENVPN_openssl_ENABLE_PORT_SHARE=y
	CONFIG_OPENVPN_openssl_ENABLE_SERVER=y
	CONFIG_OPENVPN_openssl_ENABLE_SMALL=y
	CONFIG_OPENVPN_openssl_ENABLE_SOCKS=y
	CONFIG_PACKAGE_avahi-daemon-service-http=y
	CONFIG_PACKAGE_avahi-dbus-daemon=y
	CONFIG_PACKAGE_bluez-daemon=y
	CONFIG_PACKAGE_bluez-libs=y
	CONFIG_PACKAGE_bluez-utils=y
	CONFIG_PACKAGE_ca-certificates=y
	CONFIG_PACKAGE_ca-bundle=y
	CONFIG_PACKAGE_collectd=y
	CONFIG_PACKAGE_collectd-mod-cpu=y
	CONFIG_PACKAGE_collectd-mod-interface=y
	CONFIG_PACKAGE_collectd-mod-load=y
	CONFIG_PACKAGE_collectd-mod-memory=y
	CONFIG_PACKAGE_collectd-mod-network=y
	CONFIG_PACKAGE_collectd-mod-processes=y
	CONFIG_PACKAGE_collectd-mod-uptime=y
	CONFIG_PACKAGE_curl=y
	CONFIG_PACKAGE_dbus=y
	CONFIG_PACKAGE_glib2=y
	CONFIG_PACKAGE_kmod-bluetooth=y
	CONFIG_PACKAGE_kmod-crypto-aead=y
	CONFIG_PACKAGE_kmod-crypto-cmac=y
	CONFIG_PACKAGE_kmod-crypto-ecb=y
	CONFIG_PACKAGE_kmod-crypto-hash=y
	CONFIG_PACKAGE_kmod-crypto-manager=y
	CONFIG_PACKAGE_kmod-crypto-null=y
	CONFIG_PACKAGE_kmod-crypto-pcompress=y
	CONFIG_PACKAGE_kmod-hid=y
	CONFIG_PACKAGE_kmod-i2c-core=y
	CONFIG_PACKAGE_kmod-input-core=y
	CONFIG_PACKAGE_kmod-input-evdev=y
	CONFIG_PACKAGE_kmod-lib-crc16=y
	CONFIG_PACKAGE_kmod-lib-lzo=y
	CONFIG_PACKAGE_kmod-regmap=y
	CONFIG_PACKAGE_kmod-tun=y
	CONFIG_PACKAGE_kmod-usb-uhci=y
	CONFIG_PACKAGE_libattr=y
	CONFIG_PACKAGE_libavahi-dbus-support=y
	CONFIG_PACKAGE_libcurl=y
	CONFIG_PACKAGE_libdaemon=y
	CONFIG_PACKAGE_libdbus=y
	CONFIG_PACKAGE_libexpat=y
	CONFIG_PACKAGE_libffi=y
	CONFIG_PACKAGE_libltdl=y
	CONFIG_PACKAGE_liblua=y
	CONFIG_PACKAGE_liblzo=y
	CONFIG_PACKAGE_libmbedtls=y
	CONFIG_PACKAGE_libncurses=y
	CONFIG_PACKAGE_libnetsnmp=y
	CONFIG_PACKAGE_libopenssl=y
	CONFIG_PACKAGE_libpcap=y
	CONFIG_PACKAGE_libreadline=y
	CONFIG_PACKAGE_librt=y
	CONFIG_PACKAGE_libstdcpp=y
	CONFIG_PACKAGE_libubus-lua=y
	CONFIG_PACKAGE_libuci-lua=y
	CONFIG_PACKAGE_libusb-1.0=y
	CONFIG_PACKAGE_lua=y
	CONFIG_PACKAGE_luci-base=y
	CONFIG_PACKAGE_luci-lib-ip=y
	CONFIG_PACKAGE_luci-lib-jsonc=y
	CONFIG_PACKAGE_luci-lib-nixio=y
	CONFIG_PACKAGE_nmap=y
	CONFIG_PACKAGE_openssl-util=y
	CONFIG_PACKAGE_openvpn-openssl=y
	CONFIG_PACKAGE_my-package=y
	CONFIG_PACKAGE_rpcd=y
	CONFIG_PACKAGE_snmp-utils=y
	CONFIG_PACKAGE_tcpdump=y
	CONFIG_PACKAGE_terminfo=y
	CONFIG_PACKAGE_uhttpd=y
	CONFIG_PACKAGE_usbutils=y
	CONFIG_PACKAGE_zlib=y
	CONFIG_VDI_IMAGES=y
	CONFIG_TARGET_EXT4_BLOCKSIZE=4096
	CONFIG_TARGET_EXT4_BLOCKSIZE_4K=y
	CONFIG_TARGET_EXT4_RESERVED_PCT=0
	CONFIG_TARGET_IMAGES_GZIP=y
	CONFIG_TARGET_ROOTFS_SQUASHFS=y
	CONFIG_TARGET_KERNEL_PARTSIZE=4
	CONFIG_TARGET_ROOTFS_PARTSIZE=48
	CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=256
	CONFIG_TARGET_UBIFS_FREE_SPACE_FIXUP=y
	CONFIG_TARGET_UBIFS_JOURNAL_SIZE=""
	CONFIG_TARGET_ROOTFS_TARGZ=y

	CONFIG_IMAGEOPT=y
	CONFIG_VERSIONOPT=y
	CONFIG_VERSION_DIST="${NAME}"
	CONFIG_VERSION_FILENAMES=y
	CONFIG_VERSION_HWREV=""
	CONFIG_VERSION_MANUFACTURER=""
	CONFIG_VERSION_NICK="${NAME}"
	CONFIG_VERSION_NUMBER="${VERSION}"
	CONFIG_VERSION_PRODUCT=""
	CONFIG_VERSION_REPO=http://myipkg-repo.com/%S/

	# CONFIG_KERNEL_KALLSYMS is not set
	# CONFIG_IB_STANDALONE is not set
	# CONFIG_PACKAGE_privoxy is not set
	# CONFIG_PACKAGE_luci-app-privoxy is not set
	# CONFIG_PER_FEED_REPO_ADD_COMMENTED is not set
	# CONFIG_SDK is not set
endef

##########################
#        Constants       #
##########################

# Directories
export TOP_DIR:=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
export BIN_DIR=$(TOP_DIR)/bin
export BUILD_DIR=/home/vagrant/build_dir
export FEED_DIR=$(BUILD_DIR)/feed
export PACKAGE_SRC=$(FEED_DIR)/$(PACKAGE_NAME)
export PLATFORM_DIR=$(BIN_DIR)/$(PLATFORM_PATH)
export SOURCE_DIR=$(BUILD_DIR)/platforms/$(PLATFORM_NAME)
export EXPORT_DIR=$(SOURCE_DIR)/bin

# Commands
export CP=sudo cp
export FEEDS=cd $(SOURCE_DIR) && sudo ./scripts/feeds
export MAKE=cd $(SOURCE_DIR) && sudo make

# Constants
export FEED_NAME=$(AUTHOR)
export PACKAGE_NAME=$(NAME)
export PACKAGE_CATEGORY=$(AUTHOR)

##########################
#        Functions       #
##########################

# Download Platform
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
	cat "$(platform/$*/config)" >> /tmp/$(PLATFORM_NAME).config
	echo "\n" >> /tmp/$(PLATFORM_NAME).config
	cat "$(project/config)" >> /tmp/$(PLATFORM_NAME).config

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

##########################
#        Targets         #
##########################

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
	