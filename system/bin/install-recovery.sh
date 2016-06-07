#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY:38998016:2bd65ad7d60eaf8abbbfee198454ff29915cdaad; then
  applypatch EMMC:/dev/block/platform/155a0000.ufs/by-name/BOOT:36720640:f02fe40ac935ac1bd0e18443546e57cc93a6fd08 EMMC:/dev/block/platform/155a0000.ufs/by-name/RECOVERY 2bd65ad7d60eaf8abbbfee198454ff29915cdaad 38998016 f02fe40ac935ac1bd0e18443546e57cc93a6fd08:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
