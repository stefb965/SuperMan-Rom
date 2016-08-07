#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39004160:fd5569d0b4a2528136a46a4871d1bc5c76ab8862; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:36730880:53a567b55aa6ec30bf490e0fa32c5d08f45932fa EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY fd5569d0b4a2528136a46a4871d1bc5c76ab8862 39004160 53a567b55aa6ec30bf490e0fa32c5d08f45932fa:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
