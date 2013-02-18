#!/system/bin/sh
#

PATH=/system/bin/:/system/xbin/

busybox date >/cache/removedata.txt
exec >>/cache/removedata.txt 2>&1
    # remove symlink from data/data to /datadata for secondrom
    if test -h /data/data ; then
	echo "removed symlink"
        rm /data/data
        mkdir /data/data
        chown system.system /data/data
        chmod 0771 /data/data
    fi
