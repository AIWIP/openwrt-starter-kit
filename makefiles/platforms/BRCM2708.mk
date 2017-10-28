define platform/BRCM2708/meta
	PLATFORM_NAME:=BRCM2708
	PLATFORM_PATH:=brcm2708
	OS_SOURCE_CODE:=https://github.com/lede-project/source
	OS_SOURCE_VERSION:=v17.01.1
endef

define platform/BRCM2708/config
	CONFIG_TARGET_brcm2708=y
	CONFIG_TARGET_brcm2708_bcm2709=y
	CONFIG_TARGET_brcm2708_bcm2709_DEVICE_rpi-2=y
	CONFIG_HAS_SUBTARGETS=y
	CONFIG_HAS_DEVICES=y
	CONFIG_TARGET_BOARD="brcm2708"
	CONFIG_TARGET_SUBTARGET="bcm2709"
	CONFIG_TARGET_PROFILE="DEVICE_rpi-2"
	CONFIG_TARGET_ARCH_PACKAGES="arm_cortex-a7_neon-vfpv4"
	CONFIG_DEFAULT_TARGET_OPTIMIZATION="-Os -pipe -mcpu=cortex-a7 -mfpu=neon-vfpv4"
	CONFIG_CPU_TYPE="cortex-a7+neon-vfpv4"
	CONFIG_PACKAGE_kmod-usb-net=y
	CONFIG_PACKAGE_kmod-usb-net-asix=y
	CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
	CONFIG_PACKAGE_kmod-usb-net-rndis=y
	CONFIG_PACKAGE_kmod-usb-ohci=y
	CONFIG_PACKAGE_kmod-usb2=y
	CONFIG_PACKAGE_kmod-nls-base=y
	CONFIG_PACKAGE_kmod-usb-core=y
	CONFIG_PACKAGE_kmod-libphy=y
	CONFIG_PACKAGE_udev=y
	CONFIG_PACKAGE_udevkmod-usb-net-rndis=y
	CONFIG_TARGET_ROOTFS_EXT4FS=y
endef