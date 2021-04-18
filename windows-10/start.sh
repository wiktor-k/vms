#!/bin/sh

HDD=hdd.qcow2
WIN10=win10.iso
VIRTIO=virtio.iso

MAC=$(hexdump -n 6 -ve '1/1 "%.2x "' /dev/random | awk -v a="2,6,a,e" -v r="$RANDOM" 'BEGIN{srand(r);}NR==1{split(a,b,",");r=int(rand()*4+1);printf "%s%s:%s:%s:%s:%s:%s\n",substr($1,0,1),b[r],$2,$3,$4,$5,$6}')

qemu-system-x86_64 \
    -enable-kvm \
    -m 8G \
    -vga qxl \
    -cpu host  \
    -smp cores=4,threads=8 \
    -drive driver=qcow2,file=$HDD,if=virtio \
    -netdev user,id=net0 \
    -device e1000-82545em,netdev=net0,id=net0,mac="$MAC" \
    -usb \
    -device usb-tablet \
    -rtc base=localtime,clock=host \
    -spice port=5900,addr=127.0.0.1,disable-ticketing \
    -chardev spicevmc,id=spicechannel0,name=vdagent \
    -cdrom $WIN10 \
    -drive file=$VIRTIO,index=3,media=cdrom
