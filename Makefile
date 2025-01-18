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
LUCI_DEPENDS:=
PKG_VERSION:=1.0.1
PKG_RELEASE:=20250118
URL:=http://t.me/peditx
PKGARCH:=all

define Package/luci-theme-$(THEME_NAME)/postinst
#!/bin/sh

rm -Rf /var/luci-modulecache
rm -Rf /var/luci-indexcache
exit 0

endef

include $(TOPDIR)/feeds/luci/luci.mk
# call BuildPackage - OpenWrt buildroot signature
