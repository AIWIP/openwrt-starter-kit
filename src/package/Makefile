include $(TOPDIR)/rules.mk
include $(TOPDIR)/manifest.mk

PKG_NAME:=$(NAME)
PKG_VERSION:=$(VERSION)
PKG_RELEASE:=$(RELEASE)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/my-package
  SECTION:=$(AUTHOR)
  CATEGORY:=$(AUTHOR)
  TITLE:=$(NAME)
  URL:=https://www.yourdomain.com
  PKGARCH:=all
  DEPENDS:=+luci-base
endef

define Package/my-package/description
 The codebase for the custom code for your IOT Device
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
	# $(INSTALL_DIR) $(1)/usr/lib/lua/luci/
	# $(CP) -r $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/

	# Copy Web Frontend Assets
	# $(INSTALL_DIR) $(1)/www/
	# $(CP) -r $(PKG_BUILD_DIR)/htdocs/* $(1)/www/

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
