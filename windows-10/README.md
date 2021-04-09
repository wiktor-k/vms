# Windows 10

Required images:

`win10.iso` download from: https://www.microsoft.com/en-us/software-download/windows10ISO

`virtio.iso` download from: https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/

Hard disk for installation:

    $ qemu-img create -f qcow2 hdd.qcow2 200G

## Starting the machine

Run `start.sh` and from another terminal:
```sh
$ spicy -h 127.0.0.1 -p 5900
```

For Windows to see the disk drive you need to load driver on disk selection screen: `virtio-win`, `viostor/w10/amd64`. Graphical instructions on: https://dennisnotes.com/note/20180614-ubuntu-18.04-qemu-setup/

After installation download and install QXl Driver and SPICE Agent from: https://www.spice-space.org/download.html
