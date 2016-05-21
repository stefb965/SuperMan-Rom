#!/system/bin/sh
# Written by Tkkg1994
m="/sdcard"

if [ ! -d $m/EFS_BACKUP ]; then
	mkdir $m/EFS_BACKUP
fi

cd $m/EFS_BACKUP/
mount -o rw /dev/block/sda3 /efs
tar zcvf EFS_$(date +Log_%d.%h.%y_%H.%M).tar /efs
mount -o ro /dev/block/sda3 /efs
