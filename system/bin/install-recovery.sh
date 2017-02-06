#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:46014464:6af905254d2a9427d2873091b8294ac607e67eb1; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37853184:f8627dc7834d23dc24f73bd4a756914b905b2299 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 6af905254d2a9427d2873091b8294ac607e67eb1 46014464 f8627dc7834d23dc24f73bd4a756914b905b2299:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
