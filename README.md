# rescshri - initrd Linux mini-distro

Rescshri is a shortcut from the combination of the first four letters of the words “rescue” and “shrink”. It is a Linux initram micro-distribution used to shrink the main system partitions on VPS servers.

It is possible to shrink the system partition by disabling all services and after transferring the root using pivot_root – however, this is quite problematic and time-consuming. This is where the rescshri comes in handy.

After restarting the server, we will get access to a smaller version of Linux residing in RAM, containing all the tools necessary to safely reduce/expand the partition and to perform rescue operations on the disks.

[Live Demo version](https://jm.iq.pl/rescshri-linux-mini-distribution)
-----------------------------------------------------------------------
On [this website](https://jm.iq.pl/rescshri-linux-mini-distribution), directly from the browser, and only using the Javascript and the resources of your computer, you will create a virtual machine with the full version of this micro-distribution, with a test virtual hard disk residing in RAM, on which you can test the partition shrinking operation. All you have to do is to run the guide with the tutorial command just after the full Linux start-up procedure.


Installation of rescshri
-------------------------

1. Download **[amd64](https://jm.iq.pl/rescshri/rescshri-1.2-amd64.tar.gz)** or **[i686](https://jm.iq.pl/rescshri/rescshri-1.2-i686.tar.gz)** Debian based rescshri mini-distribution.
2. Unpack *rescshri.img* to */boot* directory.
3. Copy the start entry from *grub.cfg* to the end of file */etc/grub.d/40_custom*.
4. Replace the reference at *initrd* to */boot/rescshri.img* and give the name *rescshri* to this menu entry.
5. Run *update-grub*.
6. Restart the system by holding down the shift key and select *rescshri* from the list.
7. You can use [this GitHub project](https://github.com/jaromaz/rescshri) to simply add new programs to this mini-distro.

For more information please visit my website: https://jm.iq.pl/rescshri-linux-mini-distribution

Copyright (c) 2017 Jaromaz https://jm.iq.pl
