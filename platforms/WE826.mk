define platform/WE826/meta
	PLATFORM_NAME:=WE826
	PLATFORM_PATH:=ramips/mt7620
	OS_SOURCE_CODE:=https://github.com/lede-project/source
	OS_SOURCE_VERSION:=v17.01.1
endef

define platform/WE826/config
	CONFIG_TARGET_ramips=y
	CONFIG_TARGET_ramips_mt7620=y
	CONFIG_TARGET_ramips_mt7620_DEVICE_zbt-we826=y
	CONFIG_TARGET_ARCH_PACKAGES="mips_24kc"
	CONFIG_DEFAULT_TARGET_OPTIMIZATION="-Os -pipe -mno-branch-likely -mips32r2 -mtune=24kc"
	CONFIG_CPU_TYPE="24kc"
endef