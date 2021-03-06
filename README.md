# Pi Zero 2 W Headless Server Setup

This repo describes how to setup the Pi to be a headless development server.

Download and burn the latest Lite iso using the Raspberry Pi imager: https://www.raspberrypi.com/software/operating-systems

Download the 64-bit OS here: https://downloads.raspberrypi.org/raspios_lite_arm64/images/

Before booting the Pi, change the following files:
- create an empty file at the root of boot called: ssh
- add "dtoverlay=dwc2,dr_mode=peripheral" to the end of: config.txt
- add "modules-load=dwc2,g_ether" right after rootwait in: cmdline.txt
- add file called "wpa_supplicant.conf" and add:
```
country=CA
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
  scan_ssid=1
  ssid="your_wifi_ssid"
  psk="your_wifi_password"
}
```

For overclocking try:
```
arm_freq=1200
overvoltage=6
gpu_mem=16
force_turbo=1
```
Connect Pi to computer using USB cable. Wait for it to boot up completely, at least 1 minute.

SSH into Pi using: ssh pi@raspberrypi.local

Then download and un-tar this repo:
```
wget https://github.com/mr-coxall/Pi-Zero-2-W-Headless-Server-Setup/archive/main.zip
unzip ./main.zip
rm ./main.zip
cd Pi-Zero-2-W-Headless-Server-Setup-main
chmod +x ./setup.sh
./setup.sh
```
The CD into this directory.

Change execution permissions on setup.sh
```
chmod +x ./setup
```
Then sun ./setup
