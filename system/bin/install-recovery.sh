#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:39004160:45dd0899f1805ee820354a3cd0c35d08e2991ff3; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:36730880:7beff2c01ed3231807797528014381bf93a814cf EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 45dd0899f1805ee820354a3cd0c35d08e2991ff3 39004160 7beff2c01ed3231807797528014381bf93a814cf:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
