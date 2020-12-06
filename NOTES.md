stuff for fai

FAI_CONFIG_SRC=git+http://github.com/fapestniegd/fai_config



#### windows
backshed 
https://127.0.0.1:9443/admin/

ish root@10.252.102.13


( cd var/tftproot/pxelinux.cfg; rm 0AFC660D; ln -s ../pxelinux.menus/localboot 0AFC660D )
( cd var/tftproot/pxelinux.cfg; rm 0AFC660D; ln -s ../pxelinux.menus/install_buster 0AFC660D )

clear; ./script/deploy --cluster cumberland ; clear; ./script/deploy --cluster cumberland --noop ;for host in sif volstagg; do ssh $host "/etc/rc.d/dhcpd restart"; done


#### tabs
https://github.com/jameswhite/etcfiles/pull/58/files
https://github.com/jameswhite/tfvsphere/blob/master/modules/site/main.tf
https://github.com/websages/fai_config/pull/10

https://vcsa02.apartment.jameswhite.org/ui/#

# kludges
ip route add default via 10.252.0.1
hostname 'eir'
FAI_ACTION=install /usr/sbin/fai 
... nope this doesn't start an install anymore


```
apt-get install -y startx enlightenment eterm

apt-get install -y libavahi-compat-libdnssd1 libqt5core5a libqt5gui5 libqt5network5 libqt5widgets5 libdouble-conversion1 libpcre2-16-0 libqt5dbus5 libxcb-icccm4 libxcb-image0 libxcb-randr0 libxcb-render-util0 libxcb-xinerama0 libqt5svg5 qt5-gtk-platformtheme

# Settings -> All -> Windows -> Window Focus; Uncheck Raise windows
# Enlightenment has support for a system tray but it is disabled by default. To enable the system tray, open the Enlightenment main menu, navigate to the Settings submenu and click on the Modules option. Scroll down until you see the Systray option. Highlight that option and click the Load button. Now that the module has been loaded, it can be added to the shelf. Right click on the shelf you wish to add the Systray to, hightlight the Shelf submenu and click on the Contents option. Scroll down until you see Systray. Highlight that option and click the Add button.
# Right-click the three dots to the right of the launch bar; check Autohide

dpkg -i synergy-1.12.2-1.stable.a52ccb2d.debian10_amd64.deb
```

```
mkdir -p ${target}/root/.synergy/SSL/Fingerprints/
echo <<EOF> .synergy/SSL/Fingerprints/TrustedServers.txt
51:F1:8F:F6:FB:9D:E5:9F:C0:E4:D9:36:1F:3D:F3:FD:50:17:AB:30:9B:F8:00:C9:58:CD:15:92:80:A7:5E:AE
EOF
```

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y fonts-liberation xdg-utils libu2f-udev libvulkan1
dpkg -i google-chrome-stable_current_amd64.deb

```










