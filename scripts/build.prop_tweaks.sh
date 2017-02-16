#!/sbin/sh
# Written by Tkkg1994

aromabuildprop=/tmp/aroma/buildtweaks.prop
buildprop=/system/build.prop

mount /dev/block/platform/155a0000.ufs/by-name/SYSTEM /system

if grep -q knox=1 $aromabuildprop; then
	echo "Change knox entry"
	sed -i -- 's/ro.config.knox=v30/ro.config.knox=v00/g' $buildprop
fi

if grep -q finger=1 $aromabuildprop; then
	echo "# Fingerprint Tweak" >> $buildprop
	echo "fingerprint.unlock=1" >> $buildprop
fi

if grep -q user=1 $aromabuildprop; then
	echo "# Multiuser Tweaks" >> $buildprop
	echo "fw.max_users=30" >> $buildprop
	echo "fw.show_multiuserui=1" >> $buildprop
	echo "fw.show_hidden_users=1" >> $buildprop
	echo "fw.power_user_switcher=1" >> $buildprop
fi

if grep -q fix=1 $aromabuildprop; then
	echo "# Screen mirror fix" >> $buildprop
	echo "wlan.wfd.hdcp=disable" >> $buildprop
fi

if grep -q performance=1 $aromabuildprop; then
	echo "# Performance Tweaks" >> $buildprop
	echo "debug.performance.tuning=1" >> $buildprop
	echo "debug.egl.hw=1" >> $buildprop
	echo "debug.overlayui.enable=1" >> $buildprop
	echo "video.accelerate.hw=1" >> $buildprop
	echo "dev.pm.dyn_samplingrate=1" >> $buildprop
	echo "debug.enabletr=true" >> $buildprop
	echo "ro.fb.mode=1" >> $buildprop
	echo "hw3d.force=1" >> $buildprop
	echo "persist.sys.ui.hw=1" >> $buildprop
	echo "ro.sf.compbypass.enable=0" >> $buildprop
	echo "debug.sf.hw=1" >> $buildprop
	echo "debug.composition.type=c2d" >> $buildprop
	echo "debug.composition.type=gpu" >> $buildprop
	echo "persist.sys.composition.type=c2d" >> $buildprop
	echo "persist.sys.composition.type=gpu" >> $buildprop
	echo "ro.min_pointer_dur=8" >> $buildprop
	echo "ro.product.gpu.driver=1" >> $buildprop
	echo "ro.config.disable.hw_accel=false" >> $buildprop
	echo "debug.egl.profiler=1" >> $buildprop
	echo "persist.service.lgospd.enable=0" >> $buildprop
	echo "persist.service.pcsync.enable=0" >> $buildprop
	echo "persist.sys.purgeable_assets=1" >> $buildprop
	echo "persist.sys.scrollingcache=4" >> $buildprop
	echo "persist.sys.use_16bpp_alpha=1" >> $buildprop
	echo "ro.config.hw_menu_unlockscreen=false" >> $buildprop
	echo "ro.max.fling_velocity=12000" >> $buildprop
	echo "windowsmgr.max_events_per_sec=60" >> $buildprop
fi

if grep -q powersave=1 $aromabuildprop; then
	echo "# Powersaving Tweaks" >> $buildprop
	echo "ro.config.hw_fast_dormancy=1" >> $buildprop
	echo "power.saving.mode=1" >> $buildprop
	echo "ro.ril.power_collapse=1" >> $buildprop
	echo "pm.sleep_mode=1" >> $buildprop
	echo "wifi.supplicant_scan_interval=180" >> $buildprop
	echo "ro.ril.disable.power.collapse=0" >> $buildprop
	echo "ro.config.hw_power_saving=true" >> $buildprop
	echo "ro.config.hw_quickpoweron=true" >> $buildprop
	echo "power_supply.wakeup=enable" >> $buildprop
	echo "profiler.force_disable_err_rpt=1" >> $buildprop
	echo "profiler.force_disable_ulog=1" >> $buildprop
	echo "ro.vold.umsdirtyratio=20" >> $buildprop
fi

if grep -q quickpower=1 $aromabuildprop; then
	echo "# Fastboot Tweaks" >> $buildprop
	echo "persist.sys.shutdown.mode=hibernate" >> $buildprop
	echo "boot.fps=20" >> $buildprop
fi

if grep -q network=1 $aromabuildprop; then
	echo "# Network Tweaks" >> $buildprop
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
fi

if grep -q camera=1 $aromabuildprop; then
	echo "# Camera Tweaks" >> $buildprop
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
	echo "persist.sys.use_dithering=1" >> $buildprop
	echo "ro.camcorder.videoModes=true" >> $buildprop
fi

if grep -q signal=1 $aromabuildprop; then
	echo "# Signal Tweaks" >> $buildprop
	echo "persist.cust.tel.eons=1" >> $buildprop
	echo "ro.ril.enable.3g.prefix=1" >> $buildprop
	echo "persist.telephony.support.ipv4=1" >> $buildprop
	echo "persist.telephony.support.ipv6=1" >> $buildprop
	echo "ro.ril.enable.dtm=1" >> $buildprop
	echo "ro.ril.gprsclass=10" >> $buildprop
	echo "ro.ril.hep=1" >> $buildprop
	echo "ro.ril.hsdpa.category=10" >> $buildprop
	echo "ro.ril.hsupa.category=5" >> $buildprop
	echo "ro.ril.hsxpa=2" >> $buildprop
	echo "ro.telephony.call_ring.delay=0" >> $buildprop
fi

if grep -q misc=1 $aromabuildprop; then
	echo "# Misc Tweaks" >> $buildprop
	echo "ro.HOME_APP_ADJ=1" >> $buildprop
	echo "ro.com.google.locationfeatures=1" >> $buildprop
	echo "ro.com.google.networklocation=1" >> $buildprop
	echo "ro.config.nocheckin=1" >> $buildprop
	echo "logcat.live=disable" >> $buildprop
	echo "touch.presure.scale=0.001" >> $buildprop
fi

if grep -q item.1.12=1 /tmp/aroma/google.prop; then
	echo "# Google Assistant" >> $buildprop
	echo "ro.opa.eligible_device=true" >> $buildprop
fi

exit 10

