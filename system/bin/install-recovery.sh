#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:46014464:2bd03e7164379ccfc98282f11252d6ca90fb6df6; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:37853184:d48dcc88c66c6c1ebece1537a49cacc39d63c5e5 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 2bd03e7164379ccfc98282f11252d6ca90fb6df6 46014464 d48dcc88c66c6c1ebece1537a49cacc39d63c5e5:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
