#!/bin/bash

mountPath=`echo $1`
password=`echo $2`

/usr/sbin/chroot $mountPath /bin/bash > /dev/null <<EOF

chpasswd <<<"root:$password"

exit

EOF