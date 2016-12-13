#!/sbin/sh
# Written by Tkkg1994

mount /dev/block/platform/155a0000.ufs/by-name/USERDATA /data

if [ ! -d /data/media/0/SuperMan ]; then
	mkdir /data/media/0/SuperMan
	chmod 777 /data/media/0/SuperMan
fi

cp -rf /tmp/aroma /data/media/0/SuperMan

find /data/media/0/SuperMan/aroma -type f ! -iname "*.prop" -delete

exit 10

