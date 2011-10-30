USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/admire/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi
TARGET_BOOTLOADER_BOARD_NAME := admire

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x13000000
BOARD_KERNEL_PAGESIZE := 4096

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x08c60000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/samsung/admire/kernel

#BOARD_HAS_NO_SELECT_BUTTON := true

## RECOVERY OPTIONS ##

#TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_RECOVERY_INITRC := device/samsung/admire/recovery.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/admire/recovery/recovery_ui.c
#BOARD_USES_BML_OVER_MTD := true
#BOARD_CUSTOM_BOOTIMG_MK := device/samsung/aries-common/shbootimg.mk
#TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
BOARD_HAS_NO_SELECT_BUTTON := true

# Use this flag if the board has a ext4 partition larger than 2gb
#BOARD_HAS_LARGE_FILESYSTEM := true
