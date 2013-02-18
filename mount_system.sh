#!/tmp/busybox sh
#
#
BB=/tmp/busybox
# script to mount system

if $BB grep -q /dev/lvpool/system /etc/fstab ; then
	$BB mount -t ext4 -o rw /dev/lvpool/system /system
elif $BB grep -q /dev/lvpool/secondary_system /etc/fstab ; then
	$BB mount -t ext4 -o rw /dev/lvpool/secondary_system /system
else
	echo "no system partition specified"
	exit 1
fi
exit 0

