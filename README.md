### Moto G53 5G TWRP

## Prepare
    mkdir tw
    cd tw
## Initialise TWRP Repo
    repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11
## Sync Repo
    repo sync
## Clone Recovery Tree
    git clone https://github.com/MrFluffyOven/android_device_motorola_penang.git -b twrp-11.0 device/motorola/penang
## Clone Kernel
    git clone https://github.com/MrFluffyOven/android_kernel_motorola_penang.git -b twrp-11.0 kernel/motorola/penang
## Build
    $ . build/envsetup.sh; export ALLOW_MISSING_DEPENDENCIES=true; lunch twrp_penang-eng; mka -j6 bootimage
