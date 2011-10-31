# Copyright (C) 2007 The Android Open Source Project
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

# config.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

## BOARD INFO ##
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
COPYBIT_MSM7K := true
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := admire
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true

# ARMv6-compatible processor rev 5 (v6l)
# XXX: I may switch to this config
#TARGET_ARCH_VARIANT := armv6j
#TARGET_CPU_ABI := armeabi-v6j
#TARGET_CPU_ABI2 := armeabi


## BLUETOOTH ##
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

## WIFI ##
BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
BOARD_WLAN_DEVICE           := ar6000
WIFI_DRIVER_MODULE_PATH     := "/system/wifi/ar6000.ko"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := ar6000

## FM RADIO (temporarily disabled for testing) ##
#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
#BOARD_FM_DEVICE := bcm4325

## MULTIMEDIA ##
#TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GENERIC_AUDIO := false
USE_CAMERA_STUB := true

## MISC ##
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
BOARD_USE_SCREENCAP:= true

## KERNEL ##
TARGET_PREBUILT_KERNEL := device/samsung/admire/kernel
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x13008000
BOARD_KERNEL_PAGESIZE := 4096

## PARTITION SIZES ##
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 196083712
BOARD_USERDATAIMAGE_PARTITION_SIZE := 207618048
BOARD_FLASH_BLOCK_SIZE := 4096

## PARTITION LAYOUT/INFO ##
BOARD_DATA_DEVICE := /dev/block/bml13
BOARD_DATA_FILESYSTEM := ext4
BOARD_SYSTEM_DEVICE := /dev/block/bml12
#BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/bml14
#BOARD_CACHE_FILESYSTEM := ext4
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_BOOT_DEVICE := /devlblock/bml9
BOARD_BML_BOOT := /dev/block/bml9
BOARD_RECOVERY_DEVICE := /dev/block/bml10
BOARD_BML_RECOVERY := /dev/block/bml10

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_RECOVERY_HANDLES_MOUNT := true

## RECOVERY OPTIONS ##
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/admire/recovery/recovery_ui.c
BOARD_CUSTOM_GRAPHICS           := ../../../device/samsung/admire/recovery/graphics.c
#BOARD_USES_BML_OVER_MTD := true
#BOARD_CUSTOM_BOOTIMG_MK := device/samsung/aries-common/shbootimg.mk
#TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/admire/recovery_kernel
TARGET_RECOVERY_INITRC := device/samsung/admire/recovery.rc
#BOARD_USE_USB_MASS_STORAGE_SWITCH := true
#BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"

## GPS ##
BOARD_GPS_LIBRARIES := libloc_api
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_GPS := true		
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := admire
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
