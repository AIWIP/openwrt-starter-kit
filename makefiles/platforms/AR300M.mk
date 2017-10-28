define platform/AR300M/meta
	PLATFORM_NAME:=AR300M
	PLATFORM_PATH:=AR300M
	OS_SOURCE_CODE:=https://github.com/domino-team/lede-1701
	OS_SOURCE_VERSION:=lede-17.01
endef

define platform/AR300M/config
	CONFIG_TARGET_ar71xx=y
	CONFIG_TARGET_ar71xx_generic=y
	CONFIG_TARGET_ar71xx_generic_DEVICE_gl-ar300m=y
endef