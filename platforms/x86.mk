
# Platform Metadata
#
# This contains the metadata for this platform
# such as name and OpenWRT version
#
define platform/x86/meta

	# Platform Name
	# 
	# The name of the platform, this determines the name
	# used for build folders
	#
	PLATFORM_NAME:=x86

	# Platform Path
	#
	# The location to place the build artificacts within
	# the 'bin/' folder
	#
	PLATFORM_PATH:=x86/generic

	# Source Code
	#
	# The URL for the git repository containing the OpenWRT/LEDE
	# source code
	#
	OS_SOURCE_CODE:=https://github.com/lede-project/source

	# Source Version
	#
	# The version of the OpenWRT/LEDE
	# source code to checkout, this can be a commit, tag or a branch
	#
	OS_SOURCE_VERSION:=v17.01.1
endef

# Platform Config
#
# This contains the platform specific configuration
# options for the OpenWRT/LEDE `.config` file 
#
define platform/x86/config
	CONFIG_TARGET_x86=y
	CONFIG_TARGET_x86_generic=y
	CONFIG_TARGET_x86_generic_Generic=y
	CONFIG_TARGET_ARCH_PACKAGES="i386_pentium4"
	CONFIG_DEFAULT_TARGET_OPTIMIZATION="-Os -pipe -march=pentium4"
	CONFIG_CPU_TYPE="pentium4"
	CONFIG_TARGET_ROOTFS_EXT4FS=y
endef