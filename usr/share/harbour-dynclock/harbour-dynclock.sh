#!/bin/bash
#This script is written by fravaccaro fravaccaro@jollacommunity.it
#If you want to reuse it, please don't remove this notice

hour=$(date +"%H")
min=$(date +"%M")

rm -rf /usr/share/harbour-dynclock/images/*.*
/usr/share/harbour-dynclock/script.sh
mv /usr/share/harbour-dynclock/images/clock.png /usr/share/harbour-dynclock/images/$hour$min.png
rm -rf /usr/share/themes/jolla-ambient/meegotouch/z1.0/icons/icon-launcher-clock.png
cp /usr/share/harbour-dynclock/images/$hour$min.png /usr/share/themes/jolla-ambient/meegotouch/z1.0/icons/icon-launcher-clock.png
rm -rf /usr/share/applications/jolla-clock.desktop
/usr/bin/desktop-file-install /usr/share/applications/jolla-clock.desktop
echo '[Desktop Entry]
Type=Application
Name=Clock
X-MeeGo-Logical-Id=clock-ap-name
X-MeeGo-Translation-Catalog=clock
Exec=invoker -s --type=silica-qt5 /usr/bin/jolla-clock
Comment=Jolla clock
X-Desktop-File-Install-Version=0.20' > /usr/share/applications/jolla-clock.desktop
/usr/bin/desktop-file-install /usr/share/applications/jolla-clock.desktop --set-icon=/usr/share/harbour-dynclock/images/$hour$min.png
exit 0
