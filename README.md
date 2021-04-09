# Virtual Machines

This project contains building instructions for several different virtual machines.

Qemu and Spice are required:

    # pacman -S qemu spice-gtk

## Bridge network

For the internet to work a bridge network is required. In this case this is coupled with `en*` interfaces using systemd-networkd:

```sh
$ cat /etc/systemd/network/br0.netdev
[NetDev]
Name=br0
Kind=bridge

$ cat /etc/systemd/network/bind-eth-to-bridge.network
[Match]
Name=en*

[Network]
Bridge=br0

$ cat /etc/systemd/network/bridge.network
[Match]
Name=br0

[Network]
DHCP=yes
```

Allow qemu to use the bridge:
```sh
$ cat /etc/qemu/bridge.conf
allow br0
```

Restart systemd-networkd.

Details at: https://wiki.archlinux.org/index.php/QEMU#Bridged_networking_using_qemu-bridge-helper
