export THEOS_DEVICE_IP = 172.16.100.225
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = OnScreenBanner
ARCHS = arm64
TARGET = iphone::11.4:9.0
SDKVERSION = 11.4
OnScreenBanner_FILES = Tweak.x
OnScreenBanner_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
after-install::
	install.exec "killall -9 SpringBoard"
