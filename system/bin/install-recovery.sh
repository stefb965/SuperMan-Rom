#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:46014464:4e169ffa81d1e93b74a7de362f09e8dcce23aa7d; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37853184:966fcdf17eed616b50f25f73b5e5d29708c1ef47 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 4e169ffa81d1e93b74a7de362f09e8dcce23aa7d 46014464 966fcdf17eed616b50f25f73b5e5d29708c1ef47:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
