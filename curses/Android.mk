LOCAL_PATH:= $(call my-dir)

# prebuilt libncurses
include $(CLEAR_VARS)

LOCAL_MODULE := ncurses
LOCAL_SRC_FILES := ../../../android-libncurses/libs/$(TARGET_ARCH_ABI)/libncurses.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include/

include $(PREBUILT_SHARED_LIBRARY)

# prebuilt libssl
include $(CLEAR_VARS)

LOCAL_MODULE := ssl
LOCAL_SRC_FILES := ../../../android-openssl/libs/$(TARGET_ARCH_ABI)/libssl.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include/

include $(PREBUILT_SHARED_LIBRARY)

# prebuilt libcrypto
include $(CLEAR_VARS)

LOCAL_MODULE := crypto
LOCAL_SRC_FILES := ../../../android-openssl/libs/$(TARGET_ARCH_ABI)/libcrypto.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include/

include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
L_DEFS := -DHAVE_CONFIG_H -DUSE_CURSES
L_CFLAGS := $(L_DEFS)

LOCAL_SRC_FILES := \
	cursesterm.c \
	tn5250.c

LOCAL_MODULE := tn5250
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := $(L_CFLAGS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../lib5250 \
                    $(LOCAL_PATH)/.. \
                    $(LOCAL_PATH)/../../include \
                    $(LOCAL_PATH)/../../../android-libncurses/jni/include \
		    $(LOCAL_PATH)/../../../android-openssl/jni/include

LOCAL_STATIC_LIBRARIES += lib5250
LOCAL_SHARED_LIBRARIES += libc libssl libcrypto libncurses

include $(BUILD_EXECUTABLE)
