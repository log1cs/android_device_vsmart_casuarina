#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/vsmart/casuarina

# Include common boarc configurations
include device/vsmart/msm8953-common/BoardConfigCommon.mk

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := casuarina_defconfig

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_VENDORIMAGE_PARTITION_SIZE := 811597824

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2021-11-01

# Inherit vendor board configs
include vendor/vsmart/casuarina/BoardConfigVendor.mk
