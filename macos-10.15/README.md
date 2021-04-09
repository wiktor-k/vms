# MacOS Installation

First create a hard disk:

    $ qemu-img create -f qcow2 hdd.qcow2 100G

Then get the base image and convert to ISO:

    $ ./tools/FetchMacOS/fetch.sh -v 10.15
	$ ./tools/dmg2img tools/FetchMacOS/BaseSystem/BaseSystem.dmg BaseSystem.img

(It is possible to download other versions of the system. See [MacOS Releases][MR].)

[MR]: https://en.wikipedia.org/wiki/MacOS_version_history#Releases

Then boot the machine with `./start.sh`.

First use `Disk Utility` to `Erase` the hard disk file.

Then use `Reinstall macOS` to install new version of Catalina.

Remember to `Customize` and disable all bloatware components.

When the system first boots select `Finder` and search for `Terminal`.

## Credits

This instructions are heavily based on [macOS-Simple-KVM][MSK] project.
Please support the author if you can!

[MSK]: https://github.com/foxlet/macOS-Simple-KVM
