#!/bin/bash

group=`echo $1`
lv_name=`echo $2`
hostname=`echo $3`
password=`echo $4`
address_1=`echo $5`
address_2=`echo $6`
gateway=`echo $7`
ns1=`echo $8`
ns2=`echo $9`
mount_path=`echo $10`
netmask1=`echo $11`
netmask2=`echo $12`
gateway2=`echo $13`
ns3=`echo $14`
ns4=`echo $15`


## create directory
#mkdir -p $HOME/$lv_name
#mount /dev/mapper/$group-${lv_name}1 $mount_path #/$HOME/$lv_name

#cd /root/ && /usr/sbin/chroot $lv_name /bin/bash > /dev/null <<EOF
/usr/sbin/chroot $mount_path /bin/bash > /dev/null <<EOF

## change hostname
echo "$hostname" > etc/hostname
echo "\n"

## change password
chpasswd <<<"root:$password"

## update ip
echo "##loopback" > etc/network/interfaces
echo "auto lo" >> etc/network/interfaces
echo "iface lo inet loopback" >> etc/network/interfaces
echo "\n"

echo "##primary" >> etc/network/interfaces
## echo "up ip route del default" >> etc/network/interfaces
echo "up ip route add default via $gateway dev eth0" >> etc/network/interfaces
echo "auto eth0" >> etc/network/interfaces
echo "iface eth0 inet static" >> etc/network/interfaces
echo "address $address_1" >> etc/network/interfaces
echo "netmask $netmask1" >> etc/network/interfaces
echo "gateway $gateway" >> etc/network/interfaces
echo "dns-nameservers $ns1 $ns2" >> etc/network/interfaces
echo "\n "

echo "##internal" >> etc/network/interfaces
echo "auto eth1" >> etc/network/interfaces
echo "iface eth1 inet static" >> etc/network/interfaces
echo "address $address_2" >> etc/network/interfaces
echo "netmask $netmask2" >> etc/network/interfaces
echo "##gateway $gateway2" >> etc/network/interfaces
echo "dns-nameservers $ns3 $ns4" >> etc/network/interfaces

exit

EOF

umount $mount_path #/$HOME/$lv_name
