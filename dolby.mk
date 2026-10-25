#
# Copyright (C) 2022 FlamingoOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Dolby path
DOLBY_PATH := hardware/dolby

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
   $(DOLBY_PATH)

# Enable codec support
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true

# SEPolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DOLBY_PATH)/sepolicy/vendor

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DOLBY_PATH)/dolby_framework_matrix.xml
DEVICE_MANIFEST_FILE += $(DOLBY_PATH)/vendor.dolby.hardware.dms@2.1-service.xml
    
# Configs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/configs/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml

# Dolby VNDK libs
PRODUCT_PACKAGES += \
    libstagefright_foundation-v33

PRODUCT_PACKAGES += \
    libshim_dolby

# Init
PRODUCT_PACKAGES += \
    init.dolby.rc

# Overlays    
PRODUCT_PACKAGES += \
    DolbyFrameworksResCommon

# Motorola Dolby apps
PRODUCT_PACKAGES += \
    daxService \
    MotoDolbyDax3

# Motorola framework libraries MotoDolbyDax3 needs.
# NOTE: moto-settings.jar is NOT here - the vendor blob repo
# (vendor/motorola/sm6375-common) already ships it, and shipping a second copy
# collides with that repo's install rule. We only supply the three it lacks.
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/system/framework/motoaudioeffectsdk.jar:$(TARGET_COPY_OUT_SYSTEM)/framework/motoaudioeffectsdk.jar \
    $(DOLBY_PATH)/proprietary/system/framework/moto-checkin.jar:$(TARGET_COPY_OUT_SYSTEM)/framework/moto-checkin.jar \
    $(DOLBY_PATH)/proprietary/system/framework/com.motorola.frameworks.core.addon.jar:$(TARGET_COPY_OUT_SYSTEM)/framework/com.motorola.frameworks.core.addon.jar

# Permissions / features / configs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/configs/permissions/com.dolby.daxservice.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.dolby.daxservice.xml \
    $(DOLBY_PATH)/configs/permissions/motoaudioeffectsdk.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/motoaudioeffectsdk.xml \
    $(DOLBY_PATH)/configs/permissions/moto-checkin.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/moto-checkin.xml \
    $(DOLBY_PATH)/configs/permissions/com.motorola.frameworks.core.addon.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.motorola.frameworks.core.addon.xml \
    $(DOLBY_PATH)/configs/permissions/moto-settings.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/moto-settings.xml \
    $(DOLBY_PATH)/configs/permissions/com.motorola.dolby.dolbyui.dax3.features.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.motorola.dolby.dolbyui.dax3.features.xml \
    $(DOLBY_PATH)/configs/sysconfig/hiddenapi-whitelist-com.motorola.dolby.dolbyui.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-whitelist-com.motorola.dolby.dolbyui.xml \
    $(DOLBY_PATH)/configs/default-permissions/default-permissions-com.motorola.dolby.dolbyui.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions-com.motorola.dolby.dolbyui.xml





# Media (C2)
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.0.vendor \
    android.hardware.media.c2@1.1.vendor \
    android.hardware.media.c2@1.2.vendor \
    libcodec2_hidl@1.2.vendor \
    libsfplugin_ccodec_utils.vendor \
    libcodec2_soft_common.vendor

# Codec2 Props
PRODUCT_VENDOR_PROPERTIES += \
    vendor.audio.c2.preferred=true \
    debug.c2.use_dmabufheaps=1 \
    vendor.qc2audio.suspend.enabled=true \
    vendor.qc2audio.per_frame.flac.dec.enabled=true

# Dolby Props
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.dolby.dax.version=DAX3_3.7.0.8_r1 \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.dolby.ds2.enabled=false

# Remove Packages for Dolby Support
PRODUCT_PACKAGES += \
    RemovePackagesDolby


# Dolby Proprietary blobs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/vendor/etc/init/vendor.dolby.hardware.dms@2.1-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.hardware.dms@2.1-service.rc \

PRODUCT_PACKAGES += \
    libdapparamstorage \
    libdlbpreg \
    vendor.dolby.hardware.dms@2.1 \
    libdmshal \
    libdlbdsservice \
    liboem_specific \
    vendor.dolby.hardware.dms@2.1-service \
    libdlbvol \
    libswdap \
    libswgamedap \
    libspeakerbundle
