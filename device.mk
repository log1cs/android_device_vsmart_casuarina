#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.usb.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh \
    init.msm.usb.configfs.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# WLAN firmware symlinks
PRODUCT_PACKAGES += \
    firmware_WCNSS_qcom_cfg.ini_symlink \
    firmware_WCNSS_wlan_dictionary.dat_symlink

# Inherit vendor makefiles
$(call inherit-product, vendor/vsmart/casuarina/casuarina-vendor.mk)
