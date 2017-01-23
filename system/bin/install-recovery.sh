#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:46014464:8aa8de79e4d150cb86e0cb24c0b4a2ad68656e5c; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37853184:df95ab2c9058e466fdb95b9f557479e7cb412d27 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 8aa8de79e4d150cb86e0cb24c0b4a2ad68656e5c 46014464 df95ab2c9058e466fdb95b9f557479e7cb412d27:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
