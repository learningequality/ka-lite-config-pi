# stop hostapd before replacing it
sudo service hostapd stop

# if we're not already using the original, switch
if [ -f /usr/sbin/hostapd_original ];
then
    # use the original binary hostapd, for the Wi-Pi
    sudo rm /usr/sbin/hostapd 2> /dev/null
    sudo ln -s /usr/sbin/hostapd_original /usr/sbin/hostapd
fi

# if we're not already using the original conf, switch
if [ -f /etc/hostapd/hostapd_original.conf ];
then
    # use the hostapd config file for the Edimax EW-7811Un
    sudo rm /etc/hostapd/hostapd.conf 2> /dev/null
    sudo ln -s /etc/hostapd/hostapd_original.conf /etc/hostapd/hostapd.conf
fi

# restart hostapd with the new settings
sudo service hostapd start
