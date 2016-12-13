#!/sbin/sh
# Written by Tkkg1994

mount /dev/block/platform/155a0000.ufs/by-name/USERDATA /data
mount /dev/block/platform/155a0000.ufs/by-name/EFS /efs

if [ ! -d /data/media/0/SuperMan/EFS ];then
	mkdir /data/media/0/SuperMan/EFS
	chmod 777 /data/media/0/SuperMan/EFS
fi

dd if=/dev/block/sda3 of=/data/media/0/SuperMan/EFS/efs.img bs=4096
cp /system/build.prop /data/media/0/SuperMan/EFS/build.prop

exit 10


