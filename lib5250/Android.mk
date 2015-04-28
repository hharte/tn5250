LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	buffer.c \
	conf.c \
	dbuffer.c \
	debug.c \
	display.c \
	field.c \
	macro.c \
	menu.c \
	printsession.c \
	record.c \
	scrollbar.c \
	scs.c \
	session.c \
	sslstream.c \
	stream.c \
	telnetstr.c \
	terminal.c \
	utility.c \
	version.c \
	window.c \
	wtd.c
		
LOCAL_CFLAGS := -DHAVE_CONFIG_H -DSYSCONFDIR=\"/data/data/com.magicandroidapps.betterterm/etc\" -U_XOPEN_SOURCE -D_XOPEN_SOURCE=500 -U_POSIX_C_SOURCE -D_POSIX_C_SOURCE=199506L -DNDEBUG 

LOCAL_C_INCLUDES := $(LOCAL_PATH) \
		$(LOCAL_PATH)/.. \
                $(LOCAL_PATH)/../../include \
		$(LOCAL_PATH)/../../../android-openssl/jni/include

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := lib5250

include $(BUILD_STATIC_LIBRARY)

