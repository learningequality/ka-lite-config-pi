Configuration of Raspberry Pi for KA Lite
==================

Scripts and notes for setting up a KA Lite server on a Raspberry Pi in Access Point mode

Instructions
------------------

These instructions assume that you've already [installed KA Lite on your Pi](http://kalitewiki.learningequality.org/installation/linux-installation).

1. SSH into your pi, and install git: `sudo apt-get install git`
2. Clone this repository from inside your pi's home directory, with: `git clone https://github.com/learningequality/ka-lite-pi-scripts.git`
3. Change to the `ka-lite-pi-scripts` with `cd ka-lite-pi-scripts`
3. Run `./configure.sh` to install the required libraries (hostapd & dnsmasq) and perform the basic configuration.
4. If you're using an Edimax EW-7811Un (or other RTL8188CUS-based) wifi dongle, run: `./use_edimax.sh`
5. If you're using a Wi-Pi wifi dongle, run: `./use_wipi.sh`
6. Now, when you reboot, KA Lite should be accessible via a wifi hotspot named "kalite". You should be able to load KA Lite via pretty much any URL in the address bar, but http://1.1.1.1:8008 should work if nothing else does.
