# Pi Zero 2 W Headless Server Setup

This repo describes how to setup the Pi to be a headless development server.

Download and burn the latest Lite iso using the Raspberry Pi imager: https://www.raspberrypi.com/software/

Before booting the Pi, change the following files:
- create an empty file at the root of boot called: ssh
- add "dtoverlay=dwc2" to the end of: config.txt
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