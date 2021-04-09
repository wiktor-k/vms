#!/bin/sh

HDD=hdd.qcow2
WIN10=win10.iso
VIRTIO=virtio.iso

qemu-system-x86_64 \
    -enable-kvm \
    -m 8G \
    -vga qxl \
    -cpu host  \
    -smp cores=4,threads=8 \
    -drive driver=qcow2,file=$HDD,if=virtio \
    -netdev tap,helper=/usr/lib/qemu/qemu-bridge-helper,id=nh0 \
    -device virtio-net-pci,netdev=nh0,id=nic1 \
    -device virtio-serial-pci \
    -net nic -net bridge,br=br0 \
    -usb \
    -device usb-tablet \
    -rtc base=localtime,clock=host \
    -spice port=5900,addr=127.0.0.1,disable-ticketing \
    -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
    -chardev spicevmc,id=spicechannel0,name=vdagent \
    -cdrom $WIN10 \
    -drive file=$VIRTIO,index=3,media=cdrom
