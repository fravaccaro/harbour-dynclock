#!/bin/bash
#This script is written by fravaccaro fravaccaro@jollacommunity.it
#If you want to reuse it, please don't remove this notice

cp /usr/share/harbour-dynclock/icon-launcher-clock.png /usr/share/themes/jolla-ambient/meegotouch/z1.0/icons/icon-launcher-clock.png
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
/usr/bin/desktop-file-install /usr/share/applications/jolla-clock.desktop --set-icon=icon-launcher-clock
exit 0
