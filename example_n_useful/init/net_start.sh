#iwlist wlan0 scanning
#iwlist wlan0 scanning | grep ESSID
#wpa_passphrase essid XXXXXXX(passwd)

####/etc/wpa_supplicant.conf
#ctrl_interface=/var/run/wpa_supplicant
#ap_scan=1
#network={
#	ssid="ESSID"
#	#psk="XXXXXXXXXXXX"
#	psk=XXXXXXXXXXXXXXXXXXXXX(generated psk)
#	scan_ssid=1
#	key_mgmt=WPA-PSK
#}
####/etc/wpa_supplicant.conf

ip link set dev wlan0 up
start-stop-daemon -S -b -q -m -p /run/wpa_supplicant.pid -x /usr/sbin/wpa_supplicant -- -c /etc/wpa_supplicant.conf -i wlan0
start-stop-daemon -S -q -x /sbin/dhcpcd -- wlan0
