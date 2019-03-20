#! /bin/bash

# reduce swappiness from 60 to 1
# chechk after reboot: `cat /proc/sys/vm/swappiness`
if grep -q '^vm.swappiness=1' /etc/sysctl.conf ; then
    echo 'swappiness is reduced'
else
    echo -e "vm.swappiness=1" | sudo tee -a /etc/sysctl.conf
fi

# check fstrim:
if systemctl list-timers -a | grep -q 'fstrim' ; then
    echo 'fstrim: OK'
else
    echo 'fstrim: fstrim is not enabled'
fi
