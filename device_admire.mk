$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/admire/admire-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/admire/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/admire/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/admire/ueventd.admire.rc:root/ueventd.rc \
    device/samsung/admire/prebuilt/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/admire/prebuilt/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/admire/prebuilt/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/admire/prebuilt/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/admire/prebuilt/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/admire/SCH-R720.rle:root/SCH-R720.rle \
    device/samsung/admire/init.admire.rc:root/init.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_admire
PRODUCT_DEVICE := admire
PRODUCT_MODEL := SCH-R720
