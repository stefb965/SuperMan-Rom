#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:46014464:5f6492119885cb2635b9524acdd1d6205bd57171; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37853184:e9c1edd969ae72994cc89595c84b33f54a95e6e5 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 5f6492119885cb2635b9524acdd1d6205bd57171 46014464 e9c1edd969ae72994cc89595c84b33f54a95e6e5:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
