include $(TOPDIR)/rules.mk

PKG_NAME:=my-package
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/my-package
  SECTION:=me
  CATEGORY:=me
  TITLE:=My Package
  URL:=https://www.aiwip.com
  PKGARCH:=all
  DEPENDS:=+luci-base
endef

define Package/my-package/description
 The codebase for the custom code for your IOT DEvice
endef

define Build/Prepare
	$(Build/Prepare/Default)
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -r ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/my-package/install
	# Make folders needed for files
	$(INSTALL_DIR) $(1)/www/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/
	$(INSTALL_DIR) $(1)/etc/

	# Copy environmental variables for the package
	$(CP) $(PKG_BUILD_DIR)/settings/$(ENVIRONMENT).rc $(1)/etc/env.rc

	# Copy Lua Scripts
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/
	$(CP) -r $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/

	# Copy Web Frontend Assets
	$(INSTALL_DIR) $(1)/www/
	$(CP) -r $(PKG_BUILD_DIR)/htdocs/* $(1)/www/

	# Copy Shell Scripts and Configuration Files
	$(CP) -r $(PKG_BUILD_DIR)/root/* $(1)/
endef

define Package/my-package/postinst
	#!/bin/sh
	if [ -z "$${IPKG_INSTROOT}" ]
	then
		echo "Please reboot the device to apply changes"
	fi
	exit 0
endef

$(eval $(call BuildPackage,my-package))
