#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:38922240:db61a615a181a055c931e79afe2473efbf089983; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:36644864:b5b348e625a52b73add98dc83b524cf6e317d3eb EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY db61a615a181a055c931e79afe2473efbf089983 38922240 b5b348e625a52b73add98dc83b524cf6e317d3eb:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
