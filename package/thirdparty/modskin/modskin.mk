MODSKIN_VERSION = 7e830ba1ee4660bbf6762a686f948ab1ab5e44d9
MODSKIN_SITE_METHOD = git
MODSKIN_SITE = git://github.com/simora/skin.moddedconfluence2.git
MODSKIN_INSTALL_STAGING = YES
MODSKIN_INSTALL_TARGET = YES
MODSKIN_DEPENDENCIES = xbmc
TEXTURE_PACKER=$(XBMC_DIR)/tools/TexturePacker/TexturePacker

define MODSKIN_BUILD_CMDS
	$(TEXTURE_PACKER) -use_none -i $(@D)/media -o $(@D)/media/Textures.xbt
endef

define MODSKIN_INSTALL_STAGING_CMDS
        mkdir -p $(STAGING_DIR)/usr/share/xbmc/addons/skin.moddedconfluence2
        cp -rf $(@D)/* $(STAGING_DIR)/usr/share/xbmc/addons/skin.moddedconfluence2/
endef

define MODSKIN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/xbmc/addons/skin.moddedconfluence2/media
	cd $(@D); cp -rf `ls -I media -1` $(TARGET_DIR)/usr/share/xbmc/addons/skin.moddedconfluence2
	cp -f $(@D)/media/Textures.xbt $(TARGET_DIR)/usr/share/xbmc/addons/skin.moddedconfluence2/media
endef

define MODSKIN_INSTALL_ETC
        cp -f package/thirdparty/skin.moddedconfluence2/guisettings.xml $(TARGET_DIR)/usr/share/xbmc/system/
endef

MODSKIN_POST_INSTALL_TARGET_HOOKS += MODSKIN_INSTALL_ETC

$(eval $(call GENTARGETS,package/thirdparty,modskin))
