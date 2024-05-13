WIFI_MT7601U_SITE_METHOD = git
WIFI_MT7601U_SITE = https://github.com/openipc/mt7601u
WIFI_MT7601U_SITE_BRANCH = master
WIFI_MT7601U_VERSION = $(shell git ls-remote $(WIFI_MT7601U_SITE) $(WIFI_MT7601U_SITE_BRANCH) | head -1 | cut -f1)

WIFI_MT7601U_LICENSE = GPL-2.0

WIFI_MT7601U_MODULE_MAKE_OPTS = \
	KSRC=$(LINUX_DIR) \
	KVERSION=$(LINUX_VERSION_PROBED) \
	CONFIG_WLAN=y \
	CONFIG_WIRELESS=y \
	CONFIG_WIRELESS_EXT=y \
	CONFIG_WEXT_CORE=y \
	CONFIG_WEXT_PROC=y \
	CONFIG_WEXT_PRIV=y \
	CONFIG_CFG80211=y \
	CONFIG_MAC80211=y \
	CONFIG_MAC80211_RC_MINSTREL=y \
	CONFIG_MAC80211_RC_MINSTREL_HT=y \
	CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y \
	CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"

define WIFI_MT7601U_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/mediatek
	$(INSTALL) -m 644 -t $(TARGET_DIR)/etc/mediatek $(@D)/MT7601USTA.dat
endef

$(eval $(kernel-module))
$(eval $(generic-package))
