#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39776256:b555fe3ab70d132944b281d6d970ee9fca706dc6; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37505024:3ccffb20c2d7dde4e08802add3ae42a7e5d8042c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY b555fe3ab70d132944b281d6d970ee9fca706dc6 39776256 3ccffb20c2d7dde4e08802add3ae42a7e5d8042c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
