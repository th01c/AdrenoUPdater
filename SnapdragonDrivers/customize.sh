# info
SOC=`getprop ro.soc.model`
MODVER=`grep_prop version $MODPATH/module.prop`
MODVERCODE=`grep_prop versionCode $MODPATH/module.prop`
ui_print " "
ui_print " Version=$MODVER STABLE"
ui_print " MagiskVersion=$MAGISK_VER"
ui_print " "
ui_print " Help and Donate: t.me/chinacloudgroup"
ui_print " Website: tryigit.dev/snap"
ui_print " "
ui_print " - Mount Check..."
ui_print " - Success 🌍"
ui_print " "
ui_print " - Rom Check..."
DALVL=`getprop ro.build.host`
if [ $DALVL != "xiaomi.eu" ]; then
echo " - Success Variant 1 🌍"
else
echo " "
echo "❗Very bad rom (risky)"
echo " "
fi
DALVK=`getprop pm.dexopt.first-use`
if [ $DALVK != "false" ];
then
echo " - Success Variant 2 🌍"
else
echo " "
echo "! bad rom (no support)"
echo " "
fi
echo " "
ui_print " - Android Version Check..."
[ $(getprop ro.system.build.version.sdk) -lt 31 ] && echo "! Unsupported android version detected, please upgrade." && abort
echo " - Success 🌍"
echo " "

ui_print " - Load wait..."
sleep 1

# If soc is SM8050 or SM8250, set permissions on firmware file
if [[ "$soc" == "SM8250-AC" || "$soc" == "SM8250" || "$soc" == "SM8250-AB" ]]; then
  chmod 644 /system/vendor/firmware/a650_sqe.fw
fi

# add path
set_perm $MODPATH/system/vendor/lib64/hw/libbacktrace.so 0 0 0644
set_perm_recursive $MODPATH/system/vendor 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/etc/sphal_libraries.txt 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/lib* 0 0 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH  0  0  0755  0644
set_perm_recursive $MODPATH/system/vendor/firmware 0 0 0755 0644 u:object_r:vendor_firmware_file:s0
set_perm_recursive $MODPATH/system/vendor/etc 0 0 0755 0644 u:object_r:vendor_configs_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/ 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/libEGL_adreno.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/libGLESv2_adreno.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/libadreno_app_profiles.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/libq3dtools_adreno.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/libllvm-qgl.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/libllvm-glnext.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/libllvm-qcom.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/hw/vulkan.adreno.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/egl/ 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/ 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/libVkLayer_ADRENO_qprofiler.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libVkLayer_ADRENO_qprofiler.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libEGL_adreno.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libGLESv2_adreno.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libadreno_app_profiles.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libq3dtools_adreno.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/hw/vulkan.adreno.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libllvm-qgl.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libllvm-glnext.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libllvm-qcom.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/egl/ 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/lib/egl/libVkLayer_ADRENO_qprofiler.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib64/egl/libVkLayer_ADRENO_qprofiler.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib64/libEGL.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib64/libGLESv1_CM.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib64/libGLESv2.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib64/libGLESv3.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib64/libvulkan.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib/libEGL.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib/libGLESv1_CM.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib/libGLESv2.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib/libGLESv3.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/lib/libvulkan.so 0 0 0755 0644 u:object_r:system_lib_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libdmabufheap.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib/libdmabufheap.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libCB.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/notgsl.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
set_perm_recursive $MODPATH/system/vendor/lib64/libadreno_utils.so 0 0 0755 0644 u:object_r:same_process_hal_file:s0
sleep 1

ui_print " - Success 🌍"
ui_print " "
ui_print " - Final step for GPU Cache Cleaner by tryigitx"
ui_print " - Please wait..."

# chace cleaner
check_file_exists() {
    if [ -e "$1" ]; then
        echo "Folder $1 still exists ❗"
    else
        echo " - $1 cleared 🧭"
    fi
}

find /data -type f -name '*shader*' -exec rm -f {} \;
check_file_exists /data/*shader*

find /data/user_de -type f -name '*shader_cache*/code_cache' -exec rm -f {} \;
check_file_exists /data/user_de/*shader_cache*/code_cache

ui_print " "
ui_print " - Please reboot 🎉"
ui_print " "
ui_print " "
ui_print " "