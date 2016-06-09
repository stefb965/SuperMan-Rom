#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39006208:824dd4f44eec9cb6dae40c03fd6095d0d05dce39; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:36730880:eda26aa7a34eaac4a8b17ec8df18fe34f7e998eb EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 824dd4f44eec9cb6dae40c03fd6095d0d05dce39 39006208 eda26aa7a34eaac4a8b17ec8df18fe34f7e998eb:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
