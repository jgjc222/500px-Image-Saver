TARGET = :clang
ARCHS = armv7 armv7s arm64

PACKAGE_VERSION = 0.1

include theos/makefiles/common.mk

TWEAK_NAME = 500pxPhotoSaver
500pxPhotoSaver_FILES = Tweak.xm
500pxPhotoSaver_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

before-stage::
	find . -name ".DS_Store" -delete

after-install::
	install.exec "killall -9 SpringBoard"
