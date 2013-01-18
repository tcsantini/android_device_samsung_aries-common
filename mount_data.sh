#!/system/xbin/busybox sh

BB="/system/xbin/busybox"
$BB date >/cache/mount_data.log
exec >>/cache/mount_data.log 2>&1

if $BB grep -q secondary /cache/dualboot/rom ; then
$BB mount -t vfat /dev/block/mmcblk0p1 /.secondrom
$BB chmod 0050 /.secondrom
$BB chown root.sdcard_rw /.secondrom
   data=/.secondrom/.secondrom/data.img
#################### check if data.img already created #############
		if $BB [ ! -f $data ]; then
        	   # create a file 700MB
        	   $BB dd if=/dev/zero of=$data bs=1024 count=716800
         	   # create ext4 filesystem
		   $BB mke2fs -F -T ext4 $data
		fi
$BB mkdir -p /storage/sdcard0
$BB mount -t ext4 -o rw /.secondrom/.secondrom/data.img /data
$BB mount --bind /.secondrom /storage/sdcard0

else
$BB mount -t ext4 -o rw /dev/lvpool/userdata /data
fi
$BB mount
