#!/usr/bin/env bash

# Path to ImageMagick convert program
conv="/usr/bin/convert -quiet"

# IMPORTANT: Set this to the path where the images and the script reside.
basedir="/usr/share/harbour-dynclock/"

# Time in hours
hourtime=`date "+%H"`
if [ "$hourtime" -gt "12" ]
then
        hourtime=`expr $hourtime - 12`
        # now $hourtime = hours since 12
fi

# Time in minutes
minutetime=`date "+%M"`

# 1 find angle of hour arm
hourasminutes=`expr $hourtime \* 60`
minutessincetwelve=`expr $hourasminutes + $minutetime`
hourangle=`expr $minutessincetwelve / 2`

# 2 find angle of minute arm
minuteangle=`expr $minutetime \* 6`

# 3 combine bg and hour arm
$conv ${basedir}hour.png -virtual-pixel transparent \
+distort SRT "43,43 1.0 $hourangle 43,43" \
-trim ${basedir}bg.png +swap -background none \
-layers merge +repage ${basedir}tmp.png

# 4 combine result of 3 with minute arm
$conv ${basedir}minute.png -virtual-pixel transparent \
+distort SRT "43,43 1.0 $minuteangle 43,43" \
-trim ${basedir}tmp.png +swap -background none \
-layers merge +repage ${basedir}images/clock.png

rm -rf ${basedir}tmp.png