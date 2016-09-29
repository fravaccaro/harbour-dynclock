Name:          harbour-dynclock
Version:       0.5.2
Release:       1
Summary:       DynClock
Group:         System/Tools
Vendor:        fravaccaro
Distribution:  SailfishOS
Requires:      sailfish-version >= 2.0.1
Packager:      fravaccaro <fravaccaro@jollacommunity.it>
URL:           www.jollacommunity.it
License:       GPL

%description
Change clock icon accordingly with the hour.

%files
%defattr(-,root,root,-)
/usr/share/*

%post
chmod +x /usr/share/harbour-dynclock/*.sh
mv /usr/share/harbour-dynclock/harbour-dynclock.service /etc/systemd/system/
mv /usr/share/harbour-dynclock/harbour-dynclock.timer /etc/systemd/system/
cp /usr/share/applications/jolla-clock.desktop /usr/share/harbour-dynclock/jolla-clock.desktop.bak
mkdir /usr/share/harbour-dynclock/images
/usr/share/harbour-dynclock/harbour-dynclock.sh
systemctl start harbour-dynclock.timer
systemctl enable harbour-dynclock.timer
systemctl start harbour-dynclock.service
systemctl enable harbour-dynclock.service

%preun
/usr/share/harbour-dynclock/harbour-dynclock-uninstall.sh

%postun
if [ $1 = 0 ]; then
    // Do stuff specific to uninstalls
systemctl stop harbour-dynclock.timer
systemctl disable harbour-dynclock.timer
systemctl stop harbour-dynclock.service
systemctl disable harbour-dynclock.service
rm /etc/systemd/system/harbour-dynclock.timer
rm /etc/systemd/system/harbour-dynclock.service
rm -rf /usr/share/harbour-dynclock
else
if [ $1 = 1 ]; then
    // Do stuff specific to upgrades
echo "Upgrading"
/usr/share/harbour-dynclock/harbour-dynclock.sh
fi
fi

%changelog
* Thu Sep 29 2016 0.5.2
- Black icon fixed.

* Sat Sep 24 2016 0.5.1
- Icon jumping to the bottom of the app tray may be fixed.

* Tue Jan 19 2016 0.5.0
- Sailfish OS 2.0.7 support.

* Tue Jan 19 2016 0.4.0
- High resolution support added.

* Thu Oct 8 2015 0.3.0
- Clock style updated.

* Wed Oct 7 2015 0.2.1
- Icon jumping to the bottom of the app tray may be fixed.

* Tue Sep 29 2015 0.2
- Bugfix.

* Mon Sep 28 2015 0.1
- First build.
