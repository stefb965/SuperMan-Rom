#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:38938624:38c5c7afcc9bfb596ba9b703e5f80a07500e1eb1; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:36663296:34f0a6b843584730f225536800d3a9b24b5f6ab6 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 38c5c7afcc9bfb596ba9b703e5f80a07500e1eb1 38938624 34f0a6b843584730f225536800d3a9b24b5f6ab6:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
