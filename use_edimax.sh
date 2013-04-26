# stop hostapd before replacing it
sudo service hostapd stop

# backup the hostapd binary if needed
if [ ! -f /usr/sbin/hostapd_original ];
then
    sudo mv /usr/sbin/hostapd /usr/sbin/hostapd_original
fi

# use the binary hostapd for the Edimax EW-7811Un
sudo rm /usr/sbin/hostapd 2> /dev/null
sudo ln -s `pwd`/conf/hostapd_RTL8188CUS /usr/sbin/hostapd
sudo chmod +x /usr/sbin/hostapd

# backup the hostapd config file if needed
if [ ! -f /etc/hostapd/hostapd_original.conf ];
then
    sudo mv /etc/hostapd/hostapd.conf /etc/hostapd/hostapd_original.conf
fi

# use the hostapd config file for the Edimax EW-7811Un
sudo rm /etc/hostapd/hostapd.conf 2> /dev/null
sudo ln -s `pwd`/conf/hostapd_RTL8188CUS.conf /etc/hostapd/hostapd.conf

# restart hostapd with the new settings
sudo service hostapd start
