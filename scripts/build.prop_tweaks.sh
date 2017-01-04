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
else if grep -q build=max $aromabuildprop; then
	echo "Installing max build.prop tweaks"
	echo "# Max Tweaks" >> $buildprop
	echo "fingerprint.unlock=1" >> $buildprop
	echo "fw.max_users=30" >> $buildprop
	echo "fw.show_multiuserui=1" >> $buildprop
	echo "fw.show_hidden_users=1" >> $buildprop
	echo "fw.power_user_switcher=1" >> $buildprop
	echo "wlan.wfd.hdcp=disable" >> $buildprop
	echo "boot.fps=20" >> $buildprop
	echo "debug.composition.type=c2d" >> $buildprop
	echo "debug.composition.type=gpu" >> $buildprop
	echo "debug.egl.hw=1" >> $buildprop
	echo "debug.egl.profiler=1" >> $buildprop
	echo "debug.enabletr=true" >> $buildprop
	echo "debug.overlayui.enable=1" >> $buildprop
	echo "debug.performance.tuning=1" >> $buildprop
	echo "debug.sf.hw=1" >> $buildprop
	echo "dev.pm.dyn_samplingrate=1" >> $buildprop
	echo "hw3d.force=1" >> $buildprop
	echo "logcat.live=disable" >> $buildprop
	echo "lpa.decode=false" >> $buildprop
	echo "lpa.use-stagefright=false" >> $buildprop
	echo "net.dns1=8.8.8.8" >> $buildprop
	echo "net.dns2=8.8.4.4" >> $buildprop
	echo "net.eth0.dns1=8.8.8.8" >> $buildprop
	echo "net.eth0.dns2=8.8.4.4" >> $buildprop
	echo "net.gprs.dns1=8.8.8.8" >> $buildprop
	echo "net.gprs.dns2=8.8.4.4" >> $buildprop
	echo "net.ipv4.ip_no_pmtu_disc=0" >> $buildprop
	echo "net.ipv4.route.flush=1" >> $buildprop
	echo "net.ipv4.tcp_ecn=0" >> $buildprop
	echo "net.ipv4.tcp_fack=1" >> $buildprop
	echo "net.ipv4.tcp_mem=187000" >> $buildprop
	echo "net.ipv4.tcp_moderate_rcvbuf=1" >> $buildprop
	echo "net.ipv4.tcp_no_metrics_save=1" >> $buildprop
	echo "net.ipv4.tcp_rfc1337=1" >> $buildprop
	echo "net.ipv4.tcp_rmem=4096" >> $buildprop
	echo "net.ipv4.tcp_sack=1" >> $buildprop
	echo "net.ipv4.tcp_timestamps=1" >> $buildprop
	echo "net.ipv4.tcp_window_scaling=1" >> $buildprop
	echo "net.ipv4.tcp_wmem=4096" >> $buildprop
	echo "net.ppp0.dns1=8.8.8.8" >> $buildprop
	echo "net.ppp0.dns2=8.8.4.4" >> $buildprop
	echo "net.rmnet0.dns1=8.8.8.8" >> $buildprop
	echo "net.rmnet0.dns2=8.8.4.4" >> $buildprop
	echo "net.tcp.buffersize.default=4096,87380,256960,4096,16384,256960" >> $buildprop
	echo "net.tcp.buffersize.edge=4096,87380,256960,4096,16384,256960" >> $buildprop
	echo "net.tcp.buffersize.evdo_b=6144,87380,1048576,6144," >> $buildprop
	echo "net.tcp.buffersize.gprs=4096,87380,256960,4096,16384,256960" >> $buildprop
	echo "net.tcp.buffersize.hsdpa=6144,87380,1048576,6144,8" >> $buildprop
	echo "net.tcp.buffersize.hspa=6144,87380,524288,6144,163" >> $buildprop
	echo "net.tcp.buffersize.lte=524288,1048576,2097152,5242" >> $buildprop
	echo "net.tcp.buffersize.umts=4096,87380,256960,4096,16384,256960" >> $buildprop
	echo "net.tcp.buffersize.wifi=4096,87380,256960,4096,16384,256960" >> $buildprop
	echo "net.wlan0.dns1=8.8.8.8" >> $buildprop
	echo "net.wlan0.dns2=8.8.4.4" >> $buildprop
	echo "persist.cust.tel.eons=1" >> $buildprop
	echo "persist.sampling_profiler=0" >> $buildprop
	echo "persist.service.lgospd.enable=0" >> $buildprop
	echo "persist.service.pcsync.enable=0" >> $buildprop
	echo "persist.service.swiqi.enable=1" >> $buildprop
	echo "persist.sys.composition.type=c2d" >> $buildprop
	echo "persist.sys.composition.type=gpu" >> $buildprop
	echo "persist.sys.purgeable_assets=1" >> $buildprop
	echo "persist.sys.screen_off=crt" >> $buildprop
	echo "persist.sys.screen_on=none" >> $buildprop
	echo "persist.sys.scrollingcache=4" >> $buildprop
	echo "persist.sys.shutdown.mode=hibernate" >> $buildprop
	echo "persist.sys.ui.hw=1" >> $buildprop
	echo "persist.sys.use_16bpp_alpha=1" >> $buildprop
	echo "persist.sys.use_dithering=0" >> $buildprop
	echo "persist.sys.use_dithering=1" >> $buildprop
	echo "persist.telephony.support.ipv4=1" >> $buildprop
	echo "persist.telephony.support.ipv6=1" >> $buildprop
	echo "pm.sleep_mode=1" >> $buildprop
	echo "power.saving.mode=1" >> $buildprop
	echo "power_supply.wakeup=enable" >> $buildprop
	echo "profiler.force_disable_err_rpt=1" >> $buildprop
	echo "profiler.force_disable_ulog=1" >> $buildprop
	echo "ro.HOME_APP_ADJ=1" >> $buildprop
	echo "ro.camcorder.videoModes=true" >> $buildprop
	echo "ro.com.google.locationfeatures=1" >> $buildprop
	echo "ro.com.google.networklocation=1" >> $buildprop
	echo "ro.config.disable.hw_accel=false" >> $buildprop
	echo "ro.config.hw_fast_dormancy=1" >> $buildprop
	echo "ro.config.hw_menu_unlockscreen=false" >> $buildprop
	echo "ro.config.hw_power_saving=1" >> $buildprop
	echo "ro.config.hw_quickpoweron=true" >> $buildprop
	echo "ro.config.nocheckin=1" >> $buildprop
	echo "ro.config.vc_call_steps=20" >> $buildprop
	echo "ro.gps.agps_provider=1" >> $buildprop
	echo "ro.lge.proximity.delay=15" >> $buildprop
	echo "ro.max.fling_velocity=12000" >> $buildprop
	echo "ro.media.capture.fast.fps=4" >> $buildprop
	echo "ro.media.capture.flash=led" >> $buildprop
	echo "ro.media.capture.flashIntensity=70" >> $buildprop
	echo "ro.media.capture.flashMinV=3300000" >> $buildprop
	echo "ro.media.capture.maxres=8m" >> $buildprop
	echo "ro.media.capture.slow.fps=120" >> $buildprop
	echo "ro.media.capture.torchIntensity=40" >> $buildprop
	echo "ro.media.dec.jpeg.memcap=8000000" >> $buildprop
	echo "ro.media.enc.hprof.vid.bps=8000000" >> $buildprop
	echo "ro.media.enc.hprof.vid.fps=65" >> $buildprop
	echo "ro.media.enc.jpeg.quality=100" >> $buildprop
	echo "ro.min_pointer_dur=8" >> $buildprop
	echo "ro.product.gpu.driver=1" >> $buildprop
	echo "ro.ril.def.agps.mode=1" >> $buildprop
	echo "ro.ril.disable.power.collapse=0" >> $buildprop
	echo "ro.ril.enable.3g.prefix=1" >> $buildprop
	echo "ro.ril.enable.amr.wideband=1" >> $buildprop
	echo "ro.ril.enable.dtm=1" >> $buildprop
	echo "ro.ril.gprsclass=10" >> $buildprop
	echo "ro.ril.hep=1" >> $buildprop
	echo "ro.ril.hsdpa.category=10" >> $buildprop
	echo "ro.ril.hsupa.category=5" >> $buildprop
	echo "ro.ril.hsxpa=2" >> $buildprop
	echo "ro.ril.power_collapse=1" >> $buildprop
	echo "ro.ril.sensor.sleep.control=1" >> $buildprop
	echo "ro.sf.compbypass.enable=0" >> $buildprop
	echo "ro.telephony.call_ring.delay=0" >> $buildprop
	echo "ro.vold.umsdirtyratio=20" >> $buildprop
	echo "touch.presure.scale=0.001" >> $buildprop
	echo "tunnel.decode=false" >> $buildprop
	echo "video.accelerate.hw=1" >> $buildprop
	echo "wifi.supplicant_scan_interval=180" >> $buildprop
	echo "windowsmgr.max_events_per_sec=60" >> $buildprop
else
	echo "No matching build.prop tweak detected"
fi
fi
fi

exit 10

