USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/admire/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_BOOTLOADER_BOARD_NAME := admire

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x13008000
BOARD_KERNEL_PAGESIZE := 4096

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 196083712
BOARD_USERDATAIMAGE_PARTITION_SIZE := 207618048

BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/samsung/admire/kernel

#BOARD_HAS_NO_SELECT_BUTTON := true

## RECOVERY OPTIONS ##

#TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_RECOVERY_INITRC := device/samsung/admire/recovery.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/admire/recovery/recovery_ui.c
BOARD_CUSTOM_GRAPHICS           := ../../../device/samsung/admire/recovery/graphics.c
#BOARD_USES_BML_OVER_MTD := true
#BOARD_CUSTOM_BOOTIMG_MK := device/samsung/aries-common/shbootimg.mk
#TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/admire/recovery_kernel
TARGET_RECOVERY_INITRC := device/samsung/admire/recovery.rc

BOARD_BML_BOOT := "/dev/block/bml9"
BOARD_BML_RECOVERY := "/dev/block/bml10"

# Use this flag if the board has a ext4 partition larger than 2gb
#BOARD_HAS_LARGE_FILESYSTEM := true
