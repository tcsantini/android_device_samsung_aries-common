#!/system/xbin/busybox sh

BB="/system/xbin/busybox"
$BB date >>/cache/mount_data.log
exec >>/cache/mount_data.log 2>&1

if $BB grep -q secondary /cache/dualboot/rom ; then
   if ! $BB grep -q sdcard0 /proc/mounts ; then
	$BB mkdir -p /storage/sdcard0
	$BB mount -t vfat /dev/block/vold/179:1 /storage/sdcard0
   fi
   data=/storage/sdcard0/data.img
#################### check if data.img already created #############
		if $BB [ ! -f $data ]; then
        		# create a file 400MB
        		$BB dd if=/dev/zero of=$data bs=1024 count=600000

        		# create ext4 filesystem
			$BB mke2fs -F -T ext4 $data
		fi

$BB mount -t ext4 $data /data

else
$BB mount -t ext4 /dev/lvpool/userdata /data
fi
$BB mount
