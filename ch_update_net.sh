#!/bin/bash

mountPath=`echo $1`
oldAddr1=`echo $2`
newAddr1=`echo $3`
oldNetmask1=`echo $4`
newNetmask1=`echo $5`
oldGateway=`echo $6`
newGateway=`echo $7`
oldNs1=`echo $8`
newNs1=`echo $9`
oldNs2=`echo $10`
newNs2=`echo $11`
oldAddr2=`echo $12`
newAddr2=`echo $13`
oldNetmask2=`echo $14`
newNetmask2=`echo $15`

oldGateway2=`echo $16`
newGateway2=`echo $17`
oldNs3=`echo $18`
newNs3=`echo $19`
oldNs4=`echo $20`
newNs4=`echo $21`

/usr/sbin/chroot $mountPath /bin/bash > /dev/null <<EOF

## change addr1
sed -i 's/address $oldAddr1/address $newAddr1/' /etc/network/interfaces

## change netmask1
sed -i 's/netmask $oldNetmask1/netmask $newNetmask1/' /etc/network/interfaces

## change gateway
sed -i 's/gateway $oldGateway/gateway $newGateway/' /etc/network/interfaces

## change dns-nameservers1.2
sed -i 's/dns-nameservers $oldNs1 $oldNs2/dns-nameservers $newNs1 $newNs2/' /etc/network/interfaces

## change addr2
sed -i 's/address $oldAddr2/address $newAddr2/' /etc/network/interfaces

## change netmask2
sed -i 's/netmask $oldNetmask2/netmask $newNetmask2/' /etc/network/interfaces

## change gateway2
sed -i 's/gateway $oldGateway2/gateway $newGateway2/' /etc/network/interfaces

## change dns-nameservers3.4
sed -i 's/dns-nameservers $oldNs3 $oldNs4/dns-nameservers $newNs3 $newNs4/' /etc/network/interfaces

exit

EOF