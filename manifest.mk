# manifest.mk
#
# Change the settings below to customize your image and settings
#

# Project Metadata
#
# This contains the metadata for this project
# such as name and version
#
define project/meta

	# Project Name
	# 
	# The name of the project, this determines name of package and image
	#
	NAME:=my-first-openwrt-project

	# Project Author
	# 
	# The name of the author of the project, this determines things
	# such as where the package is located in the feed
	# 
	# Note: Can only be contain alphabetical characters
	#
	AUTHOR:=yourname

	# Project Version
	# 
	# The human readable version string i.e "1.2"
	#
	VERSION:=1

	# Project Release Number
	# 
	# The iteration number of the image
	#
	RELEASE:=1

	# Feed URL
	# 
	# The URL to use for new versions of software
	#
	FEED_URL:=http://updates.myurl.com
endef

# Project Config
#
# This contains the global project configuration
# options for the OpenWRT/LEDE `.config` file 
#
define project/config
	CONFIG_PACKAGE_$(NAME)=y

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
	CONFIG_PACKAGE_ca-certificates=y
	CONFIG_PACKAGE_ca-bundle=y
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
	CONFIG_PACKAGE_openssl-util=y
	CONFIG_PACKAGE_rpcd=y
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
	# CONFIG_TARGET_ROOTFS_TARGZ is not set
endef

$(eval $(project/meta))