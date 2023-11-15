#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Release name
PRODUCT_RELEASE_NAME := penang

PRODUCT_DEVICE := penang
PRODUCT_NAME := twrp_penang
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(53)
PRODUCT_MANUFACTURER := motorola
