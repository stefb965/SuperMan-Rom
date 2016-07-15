#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39004160:ec2cc27b698ffce8581c931961f212b75b8ac288; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:36730880:8fd7b7b4a35c9bfac572c4b173d537b8b6f43247 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY ec2cc27b698ffce8581c931961f212b75b8ac288 39004160 8fd7b7b4a35c9bfac572c4b173d537b8b6f43247:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
