# update the packages (may take a long time)
sudo apt-get update && sudo apt-get -y upgrade

# install prerequisite software
sudo apt-get install -y hostapd dnsmasq

# give the Pi a static IP address
sudo ifconfig wlan0 1.1.1.1

# modify the network interface config file to support AP mode
sudo python configure_network_interfaces.py

# copy in our hostapd configuration file
sudo cp hostapd.conf /etc/hostapd/hostapd.conf

# copy in our hostapd init script
sudo cp hostapd /etc/default/hostapd

# copy in our dnsmasq configuration file
sudo cp dnsmasq.conf /etc/dnsmasq.conf

# start the hostapd and dnsmasq services
sudo service hostapd start
sudo service dnsmasq start

# set the hostapd and dnsmasq services to autostart
sudo update-rc.d hostapd enable
sudo update-rc.d dnsmasq enable

