#
# Copyright (C) 2019-2025 PeDitX <https://t.me/peditx>    
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

THEME_NAME:=pxworld
THEME_TITLE:=PXworld Theme

PKG_NAME:=luci-theme-$(THEME_NAME)
LUCI_TITLE:=PXworld Theme by PeDitX
LUCI_DEPENDS:=+luci-base
PKG_VERSION:=1.0.1
PKG_RELEASE:=20250118
URL:=http://t.me/peditx
PKGARCH:=all

define Package/luci-theme-$(THEME_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=Themes
  TITLE:=$(LUCI_TITLE)
  PKGARCH:=all
endef

define Package/luci-theme-$(THEME_NAME)/description
  A beautiful theme for LuCI, designed by PeDitX.
endef

define Package/luci-theme-$(THEME_NAME)/install
  # Install static files (CSS, fonts, images, etc.)
  $(INSTALL_DIR) $(1)/www/luci-static/$(THEME_NAME)/css
  $(INSTALL_DATA) ./htdocs/luci-static/$(THEME_NAME)/css/* $(1)/www/luci-static/$(THEME_NAME)/css/

  $(INSTALL_DIR) $(1)/www/luci-static/$(THEME_NAME)/fonts
  $(INSTALL_DATA) ./htdocs/luci-static/$(THEME_NAME)/fonts/* $(1)/www/luci-static/$(THEME_NAME)/fonts/

  $(INSTALL_DIR) $(1)/www/luci-static/$(THEME_NAME)/img
  $(INSTALL_DATA) ./htdocs/luci-static/$(THEME_NAME)/img/* $(1)/www/luci-static/$(THEME_NAME)/img/

  $(INSTALL_DIR) $(1)/www/luci-static/$(THEME_NAME)/js
  $(INSTALL_DATA) ./htdocs/luci-static/$(THEME_NAME)/js/* $(1)/www/luci-static/$(THEME_NAME)/js/

  $(INSTALL_DATA) ./htdocs/luci-static/$(THEME_NAME)/favicon.ico $(1)/www/luci-static/$(THEME_NAME)/
  $(INSTALL_DATA) ./htdocs/luci-static/$(THEME_NAME)/logo.png $(1)/www/luci-static/$(THEME_NAME)/
  $(INSTALL_DATA) ./htdocs/luci-static/$(THEME_NAME)/logo.svg $(1)/www/luci-static/$(THEME_NAME)/
  $(INSTALL_DATA) ./htdocs/luci-static/$(THEME_NAME)/manifest.json $(1)/www/luci-static/$(THEME_NAME)/

  # Install Lua view files
  $(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/themes/$(THEME_NAME)
  $(INSTALL_DATA) ./luasrc/view/themes/$(THEME_NAME)/* $(1)/usr/lib/lua/luci/view/themes/$(THEME_NAME)/

  # Install UCI defaults
  $(INSTALL_DIR) $(1)/etc/uci-defaults
  $(INSTALL_BIN) ./root/etc/uci-defaults/30_luci-pxworld $(1)/etc/uci-defaults/

  # Install executable scripts
  $(INSTALL_DIR) $(1)/usr/libexec/$(THEME_NAME)
  $(INSTALL_BIN) ./root/usr/libexec/$(THEME_NAME)/* $(1)/usr/libexec/$(THEME_NAME)/
endef

define Package/luci-theme-$(THEME_NAME)/postinst
#!/bin/sh
  rm -Rf /var/luci-modulecache
  rm -Rf /var/luci-indexcache
  exit 0
endef

include $(TOPDIR)/feeds/luci/luci.mk
$(eval $(call BuildPackage,luci-theme-$(THEME_NAME)))
