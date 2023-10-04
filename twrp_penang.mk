#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from penang device
$(call inherit-product, device/motorola/penang/device.mk)

PRODUCT_DEVICE := penang
PRODUCT_NAME := twrp_penang
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Holi for arm64
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="penang_g-user 11 T1TP33.75-96-1 7c777 release-keys"

BUILD_FINGERPRINT := motorola/penang_g/penang:11/T1TP33.75-96-1/7c777:user/release-keys
