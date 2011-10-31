$(call inherit-product, build/target/product/full_base.mk)

## GPS config ##
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## Device-specific overlay ##
DEVICE_PACKAGE_OVERLAYS := device/samsung/admire/overlay

## HAL libs and other system binaries ##
PRODUCT_PACKAGES += \
    brcm_patchram_plus \
    copybit.admire \
    gralloc.admire \
    libOmxCore \
    make_ext4fs \
    dexpreopt \
    screencap 

## Use prebuilt kernel if possible ##
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/admire/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

## Board-specific init ##
PRODUCT_COPY_FILES += \
    device/samsung/admire/ueventd.admire.rc:root/ueventd.rc \
    device/samsung/admire/prebuilt/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/admire/prebuilt/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/admire/prebuilt/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/admire/prebuilt/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/admire/prebuilt/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/admire/SCH-R720.rle:root/SCH-R720.rle \
    device/samsung/admire/init.admire.rc:root/init.rc \
    device/samsung/admire/init.qcom.post_boot.sh:root/init.qcom.post_boot.sh \
    device/samsung/admire/init.qcom.rc:root/init.qcom.rc \
    device/samsung/admire/init.qcom.sh:root/init.qcom.sh

## Keymaps ##
PRODUCT_COPY_FILES += \
    device/samsung/admire/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/admire/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/admire/sec-key.kl:system/usr/keychars/sec-key.kl

## WiFi stuff ##
PRODUCT_COPY_FILES += \
    device/samsung/admire/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/admire/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/admire/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

## Media stuff ##
PRODUCT_COPY_FILES += \
    device/samsung/admire/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/admire/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/admire/vold.fstab:system/etc/vold.fstab \
    #device/samsung/admire/media_profiles.xml:system/etc/media_profiles.xml 

## Property overrides ##
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    qemu.sf.lcd_density=160

## Check for proprietary binaries ##
$(call inherit-product-if-exists, vendor/samsung/admire/admire-vendor.mk)

## Product over-rides and info ##
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_admire
PRODUCT_DEVICE := admire
PRODUCT_MODEL := SCH-R720
