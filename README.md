packer-lio
==========

Create an Ubuntu 14.04 vagrant box with packer that has the Linux target subsystem (LIO), rtslib, and targetcli ready to go.

### Usage
```
$ git clone https://github.com/Thingee/packer-lio
$ cd packer-lio
$ packer build packer.json
```

### Dependencies
* [KVM](http://www.linux-kvm.org/page/Main_Page)
* [QEMU](http://wiki.qemu.org/Main_Page)
* [Vagrant libvirt](https://github.com/pradels/vagrant-libvirt)
* [Packer](http://packer.i)
