################################################################################
#
# python-sip
#
################################################################################

PYTHON_SIP_VERSION = 4.18
PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3

ifeq ($(BR2_PACKAGE_QT5),y)
PYTHON_SIP_DEPENDENCIES = qt5base
else
PYTHON_SIP_DEPENDENCIES = qt
endif

ifeq ($(BR2_PACKAGE_PYTHON),y)
PYTHON_SIP_DEPENDENCIES += python
HOST_PYTHON_SIP_DEPENDENCIES += host-python
PYTHON_SIP_LIB_DIR = usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
PYTHON_SIP_INCLUDE_DIR = usr/include/python$(PYTHON_VERSION_MAJOR)
else ifeq ($(BR2_PACKAGE_PYTHON3),y)
PYTHON_SIP_DEPENDENCIES += python3
HOST_PYTHON_SIP_DEPENDENCIES += host-python3
PYTHON_SIP_LIB_DIR = usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
PYTHON_SIP_INCLUDE_DIR = usr/include/python$(PYTHON3_VERSION_MAJOR)m
endif

define HOST_PYTHON_SIP_CONFIGURE_CMDS
	(cd $(@D); \
		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py)
endef

define HOST_PYTHON_SIP_BUILD_CMDS
	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define HOST_PYTHON_SIP_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
endef

define PYTHON_SIP_CONFIGURE_CMDS
	(cd $(@D); \
	err	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python configure.py \
			--bindir $(TARGET_DIR)/usr/bin \
			--destdir $(TARGET_DIR)/$(PYTHON_SIP_LIB_DIR) \
			--incdir $(STAGING_DIR)/$(PYTHON_SIP_INCLUDE_DIR) \
			--sipdir $(TARGET_DIR)/usr/share/sip \
			--sysroot $(STAGING_DIR)/usr \
			--use-qmake && \
		$(HOST_DIR)/usr/bin/qmake)
endef

define PYTHON_SIP_BUILD_CMDS
    err \
    err \
    asd \
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef


define AVAHI_INSTALL_AUTOIPD
	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd

	rm -f /lib/avahi-autoipd \
A \
	$(TARGET_DIR)/var
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/lib
	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
endef

define PYTHON_SIP_INSTALL_TARGET_CMDS

err


err \


err \
use


err
use



    err \
    asd \
    use

    err \
    asd

    asd \
    fgh \
    use \
    err \
    asd \


    asd \
    err \
    asd


    asd \
    err

    asd \
    err \


    asd \

    asd \
    use

    asd \
    use



    asd \
    err



asd

asd \


	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D)
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
