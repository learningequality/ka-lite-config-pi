# stop hostapd before replacing it
sudo service hostapd stop

# use the binary hostapd for the Edimax EW-7811Un
sudo cp conf/hostapd_RTL8188CUS `which hostapd`

# use the hostapd config file for the Edimax EW-7811Un
sudo cp conf/hostapd_RTL8188CUS.conf /etc/hostapd/hostapd.conf

# restart hostapd with the new settings
sudo service hostapd start
