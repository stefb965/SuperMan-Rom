#!/sbin/sh
# Written by Tkkg1994

getprop ro.boot.bootloader >> /tmp/BLmodel

mount /dev/block/platform/155a0000.ufs/by-name/SYSTEM /system

# Change CSC to right model
if [ -e /system/CSCVersion.txt ]; then
	if grep -q G935 /tmp/BLmodel;
	then
		sed -i -- 's/G930/G935/g' /system/CSCVersion.txt
		sed -i -- 's/G930/G935/g' /system/SW_Configuration.xml
	else if grep -q G930 /tmp/BLmodel;
	then
		sed -i -- 's/G935/G930/g' /system/CSCVersion.txt
		sed -i -- 's/G935/G930/g' /system/SW_Configuration.xml
	else
		echo "Not a supported model, keep csc config default!"
	fi
	fi
fi

# Change build.prop to right model
if grep -q G935F /tmp/BLmodel;
then
	echo "Already a G935F model, nothing to change"
else if grep -q G930F /tmp/BLmodel;
then
	sed -i -- 's/G935F/G930F/g' /system/build.prop
	sed -i -- 's/hero2lte/herolte/g' /system/build.prop	
else if grep -q G930K /tmp/BLmodel;
then
	sed -i -- 's/G935F/G930K/g' /system/build.prop
	sed -i -- 's/hero2lte/herolte/g' /system/build.prop
else if grep -q G930L /tmp/BLmodel;
then
	sed -i -- 's/G935F/G930L/g' /system/build.prop
	sed -i -- 's/hero2lte/herolte/g' /system/build.prop
else if grep -q G930S /tmp/BLmodel;
then
	sed -i -- 's/G935F/G930S/g' /system/build.prop
	sed -i -- 's/hero2lte/herolte/g' /system/build.prop
else if grep -q G930W8 /tmp/BLmodel;
then
	sed -i -- 's/G935F/G930W8/g' /system/build.prop
	sed -i -- 's/hero2lte/herolte/g' /system/build.prop
else if grep -q G935K /tmp/BLmodel;
then
	sed -i -- 's/G935F/G935K/g' /system/build.prop
else if grep -q G935L /tmp/BLmodel;
then
	sed -i -- 's/G935F/G935L/g' /system/build.prop
else if grep -q G935S /tmp/BLmodel;
then
	sed -i -- 's/G935F/G935S/g' /system/build.prop
else if grep -q G935W8 /tmp/BLmodel;
then
	sed -i -- 's/G935F/G935W8/g' /system/build.prop
else
	echo "Not a supported model, keep build.prop default!"
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi

exit 10


