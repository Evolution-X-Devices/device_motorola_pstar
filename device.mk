#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
$(call inherit-product, device/motorola/sm8250-common/common.mk)

# A/B
AB_OTA_PARTITIONS += \
    vbmeta_system \
    vendor_boot

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResPstar \
    FrameworksResDeviceRetcn \
    LineagePlatformDevice \
    SystemUIResPstar \
    WifiResDevice \
    WifiResDeviceRetcn

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    libgui_shim_vendor

# Init
PRODUCT_PACKAGES += \
    init.device.rc

# LiveDisplay
$(call soong_config_set_bool,livedisplay_sysfs,enable_af,true)

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_ODM)/etc/media_profiles_V1_0.xml

# Moto Camera 4
TARGET_MOTCAMERA4 := pstar

$(call inherit-product, vendor/motorola/MotCamera4-sm8250/motcamera4.mk)

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.st

# Properties
PRODUCT_PACKAGES += \
    carrier.retcn.prop

# Shipping API level
BOARD_SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/pstar/pstar-vendor.mk)
