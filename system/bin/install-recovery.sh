#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:46014464:734126f2e9deed30b563ac07909bd55420d62d48; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37853184:665f5fea796702b1e7ef6882a6be239ceb6c7d8b EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 734126f2e9deed30b563ac07909bd55420d62d48 46014464 665f5fea796702b1e7ef6882a6be239ceb6c7d8b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
