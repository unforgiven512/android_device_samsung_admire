# Copyright (C) 2011 Gerad Munsch
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# General config
$(call inherit-product, build/target/product/full_base.mk)

# GPS config
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Device-specific overlay
DEVICE_PACKAGE_OVERLAYS := device/samsung/admire/overlay

# Replace some inherited values with our own
# Product information
PRODUCT_NAME := admire
PRODUCT_DEVICE := admire
PRODUCT_MODEL := SCH-R720

# Packages
# XXX: I may move Gallery3d to vendor/samsung/admire/admire-vendor.mk
PRODUCT_PACKAGES += \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    libOmxCore \
    libOmxVidEnc \
    FM \
    make_ext4fs \
    brcm_patchram_plus \
    sec_touchscreen.kcm \
    copybit.admire \
    gralloc.admire \
    setup_fs \
    dexpreopt

# XXX: To be added to above list in time
# screencap
# FM
# lights.admire

# Use local (prebuilt) kernel if it exists
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/admire/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Inherit stuff that is dependent on the proprietary drivers being present
$(call inherit-product-if-exists, vendor/samsung/admire/admire-vendor.mk)

# Enable dex-preopt
DISABLE_DEXPREOPT := false

# Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Board-specific init
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

# Keymaps
PRODUCT_COPY_FILES += \
    device/samsung/admire/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/admire/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/admire/sec-key.kl:system/usr/keychars/sec-key.kl

# WiFi stuff
PRODUCT_COPY_FILES += \
    device/samsung/admire/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/admire/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/admire/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Media stuff
PRODUCT_COPY_FILES += \
    device/samsung/admire/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/admire/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/admire/vold.fstab:system/etc/vold.fstab \
    #device/samsung/admire/media_profiles.xml:system/etc/media_profiles.xml 

# Property overrides
PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy

PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.telephony.ril_class=samsung \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=20 \
    ro.com.android.dataroaming=false

# screen density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# XXX: We might enable precise GC data
#PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed, but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=32m \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072 \
    ro.compcache.default=0

# Inherit proprietary drivers, if they exist
$(call inherit-product-if-exists, vendor/samsung/admire/admire-vendor-blobs.mk)
