#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Indicate the first API level the device has been commercially launched on
PRODUCT_SHIPPING_API_LEVEL := 28

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from device makefile
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_NAME := lineage_casuarina
PRODUCT_DEVICE := casuarina
PRODUCT_MANUFACTURER := Vsmart
PRODUCT_BRAND := Vsmart
PRODUCT_MODEL := Joy 3

PRODUCT_GMS_CLIENTID_BASE := android-vsmart

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=casuarina_open \
    BuildDesc="casuarina_open-user 10 QKQ1.200311.002 V430A_OPN_U_B15_211112 release-keys"
    BuildFingerprint=vsmart/casuarina_open/casuarina:10/QKQ1.200311.002/V430A_OPN_U_B15_211112:user/release-keys
