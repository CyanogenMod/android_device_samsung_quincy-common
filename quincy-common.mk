#
# Copyright (C) 2011 The CyanogenMod Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/quincy-common/quincy-common-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/quincy-common/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml 

# BT firmware
PRODUCT_COPY_FILES += \
    device/samsung/quincy-common/firmware/bcm4330B1.hcd:system/etc/firmware/bcm4330B1.hcd

# S-Pen IDC
PRODUCT_COPY_FILES += \
    device/samsung/quincy-common/idc/sec_e-pen.idc:system/usr/idc/sec_e-pen.idc \
    device/samsung/quincy-common/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc    

# Vold configuration
PRODUCT_COPY_FILES += \
    device/samsung/quincy-common/vold.fstab:system/etc/vold.fstab

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# QRNGD
PRODUCT_PACKAGES += qrngd

# Common features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml

# common msm8660
$(call inherit-product, device/samsung/msm8660-common/msm8660.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

