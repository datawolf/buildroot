################################################################################
#
# lxcfs
#
################################################################################

LXCFS_VERSION = lxcfs-0.16
LXCFS_SITE = $(call github,lxc,lxcfs,$(LXCFS_VERSION))
LXCFS_LICENSE = BSD-2
LXCFS_LICENSE_FILES = COPYING
LXCFS_DEPENDENCIES = libfuse


define BOOTSTRAP
	$(TARGET_MAKE_ENV)  cd $(@D); ./bootstrap.sh; cd -
endef

LXCFS_PRE_CONFIGURE_HOOKS += BOOTSTRAP
define LXCFS_CONFIGURE_CMDS
	$(TARGET_MAKE_ENV) cd $(@D);  ./configure; cd -
endef

define LXCFS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define LXCFS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install prefix=$(TARGET_DIR)/usr
endef


$(eval $(generic-package))

