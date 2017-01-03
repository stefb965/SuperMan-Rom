#!/sbin/sh
# Written by Tkkg1994

aromabuildprop=/tmp/aroma/buildtweaks.prop
kernelprop=/tmp/aroma/kernel.prop
buildprop=/system/build.prop

mount /dev/block/platform/155a0000.ufs/by-name/SYSTEM /system

if grep -q kernel=stock $kernelprop; then
	echo "stock kernel detected, nothing to delete"
else if grep -q kernel=super $kernelprop; then
	echo "custom kernel detected, deleting false build.prop entries"
	sed -i /timaversion/d $buildprop
	sed -i /security.mdpp.mass/d $buildprop
	sed -i /ro.hardware.keystore/d $buildprop
else if grep -q kernel=superstock $kernelprop; then
	echo "custom kernel detected, deleting false build.prop entries"
	sed -i /timaversion/d $buildprop
	sed -i /security.mdpp.mass/d $buildprop
	sed -i /ro.hardware.keystore/d $buildprop
else
	echo "Something went wrong with kernel detection"
fi
fi
fi

if grep -q build=none $aromabuildprop; then
	echo "Installing minmal build.prop tweaks"
	echo "# No Tweaks" >> $buildprop
	echo "fingerprint.unlock=1" >> $buildprop
	echo "fw.max_users=30" >> $buildprop
	echo "fw.show_multiuserui=1" >> $buildprop
	echo "fw.show_hidden_users=1" >> $buildprop
	echo "fw.power_user_switcher=1" >> $buildprop
	echo "wlan.wfd.hdcp=disable" >> $buildprop
else if grep -q build=stock $aromabuildprop; then
	echo "Installing stock build.prop tweaks"
	echo "# Stock Tweaks" >> $buildprop
	echo "fingerprint.unlock=1" >> $buildprop
	echo "fw.max_users=30" >> $buildprop
	echo "fw.show_multiuserui=1" >> $buildprop
	echo "fw.show_hidden_users=1" >> $buildprop
	echo "fw.power_user_switcher=1" >> $buildprop
	echo "wlan.wfd.hdcp=disable" >> $buildprop
	echo "debug.performance.tuning=1" >> $buildprop
	echo "ro.config.hw_fast_dormancy=1" >> $buildprop
	echo "ro.config.vc_call_steps=20" >> $buildprop
	echo "ro.ril.enable.amr.wideband=1" >> $buildprop
	echo "ro.config.disable.hw_accel=false" >> $buildprop
	echo "ro.fb.mode=1" >> $buildprop
	echo "ro.media.enc.jpeg.quality=100" >> $buildprop
	echo "ro.sf.compbypass.enable=0" >> $buildprop
	echo "persist.sys.ui.hw=1" >> $buildprop
	echo "power.saving.mode=1" >> $buildprop
	echo "ro.config.hw_quickpoweron=true" >> $buildprop
	echo "ro.config.hw_power_saving=true" >> $buildprop
	echo "ro.ril.disable.power.collapse=1" >> $buildprop
	echo "pm.sleep_mode=1" >> $buildprop
else
	echo "No matching build.prop tweak detected"
fi
fi

exit 10

