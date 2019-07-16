INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = OnScreenBanner

OnScreenBanner_FILES = Tweak.x
OnScreenBanner_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
