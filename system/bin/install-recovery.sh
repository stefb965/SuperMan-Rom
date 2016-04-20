#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:38914048:69ea9347f441cf5c56b8d61284843a5f24b551e8; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:36646912:8c76f4f7b68ed10f4ac6d7c12954ee1db1953c9c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 69ea9347f441cf5c56b8d61284843a5f24b551e8 38914048 8c76f4f7b68ed10f4ac6d7c12954ee1db1953c9c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
