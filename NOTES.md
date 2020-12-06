stuff for fai

FAI_CONFIG_SRC=git+http://github.com/fapestniegd/fai_config


 - scripts/BUSTER/40-dracut
   - prepare the install environment to run dracut
   - run dracut in the install environement
   - prepare the target environment to run dracut
 - scripts/BUSTER/60-grub
   - points grub to the initrd created in the install environment


replace quiet in the kernel command line with rd.shell to get a dracut shell

  - iterating in the install root
```
 clear; rm -rf /var/lib/fai/config; (cd /var/lib/fai; git clone https://github.com/websages/fai_config config && (cd config; git checkout eir-fixes))
 /var/lib/fai/config/scripts/BUSTER/40-dracut

```

  - From the install environment:
    - cat /etc/dracut.conf.d/* | sed -e 's/#.*//' | grep . | sort -uclear; cat /etc/dracut.conf.d/* | sed -e 's/#.*//' | grep . | sort -u
    - run `/var/lib/fai/config/scripts/BUSTER/40-dracut 2>&1 | tee wtf`
    - check the exit status
    - unpack ${target}/boot/initrd.img-$(uname -r)
      - [ -d /target/tmp/initrd.d/ ] && rm -rf /target/tmp/initrd.d/; mkdir -p /target/tmp/initrd.d/
      - (cd /target/tmp/initrd.d/ ; cat /target/boot/initrd.img-4.19.0-8-amd64 | gzip -dc | cpio -idm)
    - ensure the following files are in both the install environement `/` and target `/target/`
      - /etc/dracut.conf.d/01-omit.conf                     # tells dracut to omit systemd, lvm, mdraid, etc, and to add lvm and crypt
      - /etc/dracut.conf.d/10-crypt.conf                    # tells dracut to install our crypttab files and /boot/setup storage into the initrd
      - /usr/lib/dracut/modules.d/91local/module-setup.sh   # installs the hook to run `$modddir/mount-local.sh`
      - /usr/lib/dracut/modules.d/91local/mount-local.sh    # runs /boot/setup/storage on boot
      - /boot/setup-storage                                 # does some prep,  activates encrypted volumes, starts lvm, mounts filesystems


You need a package source (can we pin this with recollections?)
You need an nfsroot (can we build this with docker?)
You need an FAI kernel and initrd (do these come from the nfsroot?)
# apt-get install linux-image-4.19.0-13-amd64 (this updates under your feet, fucking you hard)
You need a bootable cd-image (can we generate *THIS* with docker?)
You need a fai-config space (github.com works fine)
  - this should create root on lvm on key-locked luks, and install the dracut modules to fetch the key and decrypt it on boot
    - `/etc/dracut.conf.d/*` is where modules are toggled on and off
    - `/usr/lib/dracut/modules.d/` is where the modules are
      - modules should have a check(), depends(), and install(), functions
You need a dhcp server that can hand out options
You need a tftp server to host the kernel/initrd (can this be hooktftp or tfpd-cgi?)
You need a web server to host the cd-image



/lib/dracut/hooks/initqueue/settled/blocksumlink.sh -e /dev/mapper-vg0-root
`$hookdir/initqueue/finished/*.sh`


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










