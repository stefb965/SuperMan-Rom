#!/sbin/sh
# Written by Tkkg1994

getprop ro.boot.bootloader >> /tmp/BLmodel

mount /dev/block/platform/155a0000.ufs/by-name/SYSTEM /system
mount /dev/block/platform/155a0000.ufs/by-name/USERDATA /data
mount /dev/block/platform/155a0000.ufs/by-name/EFS /efs

if grep -q G935 /tmp/BLmodel;
then
	sed -i -- 's/G930/G935/g' /system/CSCVersion.txt
	sed -i -- 's/G930/G935/g' /system/SW_Configuration.xml
else
	sed -i -- 's/G935/G930/g' /system/CSCVersion.txt
	sed -i -- 's/G935/G930/g' /system/SW_Configuration.xml
fi;


exit 10


