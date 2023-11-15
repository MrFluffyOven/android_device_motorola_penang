#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# define hardware platform
PRODUCT_PLATFORM := holi

# A/B support
AB_OTA_UPDATER := true

LOCAL_PATH := device/motorola/penang

# A/B
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    product \
    recovery \
    vbmeta \
    vbmeta_system \
    dtbo

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# tell update_engine to not change dynamic partition table during updates
# needed since our qti_dynamic_partitions does not include
# vendor and odm and we also dont want to AB update them
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery \
    bootctrl.$(PRODUCT_PLATFORM).recovery

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Encryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Blacklist
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.bootimage.build.date.utc \
    ro.build.date.utc

    # Copy modules for depmod
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/adapter_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/adapter_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/cw2217b_fg_mmi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/cw2217b_fg_mmi.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_annotate.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_annotate.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_info.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_info.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_charger.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_charger.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_discrete_charger.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_discrete_charger.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_discrete_charger_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_discrete_charger_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/qpnp_adaptive_charge.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/qpnp_adaptive_charge.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/qpnp-power-on-mmi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/qpnp-power-on-mmi.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/phy-qcom-ufs.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/phy-qcom-ufs.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/phy-qcom-ufs-qmp-v3.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/phy-qcom-ufs-qmp-v3.ko
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/phy-qcom-ufs-qmp-v4-yupik.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/phy-qcom-ufs-qmp-v4-yupik.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/phy-qcom-ufs-qrbtc-sdm845.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/phy-qcom-ufs-qrbtc-sdm845.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/rt_pd_manager.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/rt_pd_manager.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/sdhci-msm.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/sdhci-msm.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/sgm4154x_charger.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/sgm4154x_charger.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/tcpc_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/tcpc_class.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/tcpc_rt1711h.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/tcpc_rt1711h.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/tcpc_sgm7220.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/tcpc_sgm7220.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/ufshcd-crypto-qti.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/ufshcd-crypto-qti.ko \
    $(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/ufs-qcom.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/ufs-qcom.ko \

