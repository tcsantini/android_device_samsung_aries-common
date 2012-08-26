#!/bin/sh

VENDOR=samsung
DEVICE=aries-common
rom=~/android/vibrant

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling common files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    cp $rom/system/$FILE $BASE/$FILE
	echo "copying $FILE"
done

./setup-makefiles.sh
