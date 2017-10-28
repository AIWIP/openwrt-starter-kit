define platform/X86/meta
	PLATFORM_NAME:=X86
	PLATFORM_PATH:=x86/generic
	OS_SOURCE_CODE:=https://github.com/lede-project/source
	OS_SOURCE_VERSION:=v17.01.1
endef

define platform/X86/config
	CONFIG_TARGET_x86=y
	CONFIG_TARGET_x86_generic=y
	CONFIG_TARGET_x86_generic_Generic=y
	CONFIG_TARGET_ARCH_PACKAGES="i386_pentium4"
	CONFIG_DEFAULT_TARGET_OPTIMIZATION="-Os -pipe -march=pentium4"
	CONFIG_CPU_TYPE="pentium4"
	CONFIG_TARGET_ROOTFS_EXT4FS=y
endef