#!/sbin/sh
# Written by Tkkg1994

mount /dev/block/sda14 /system
mount /dev/block/sda18 /data
mount /dev/block/sda3 /efs

if [ ! -d /storage/self/primary/EFSBackup ];then
  mkdir /storage/self/primary/EFSBackup
fi

dd if=/dev/block/sda3 of=/storage/self/primary/EFSBackup/efs.img bs=4096
cp /system/build.prop /storage/self/primary/EFSBackup/build.prop

unmount /system
unmount /data
unmount /efs

exit 10


