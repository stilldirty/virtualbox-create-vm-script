#! /bin/bash


vboxmanage createvm --name windows7-2 --register
vboxmanage modifyvm windows7-2 --memory 2000 --boot1 dvd
VBoxManage modifyvm windows7-2 --nic1 bridged --nictype1 82545EM --bridgeadapter1 vmbridge
vboxmanage modifyvm windows7-2 --ostype windows7_64
vboxmanage modifyvm "windows7-2" --audio none
vboxmanage createhd --filename /home/cuckoo/vms/windows7-2.vdi --size 20000
vboxmanage storagectl "windows7-2" --name "IDE Controller" --add ide
vboxmanage modifyvm "windows7-2" --ioapic on
vboxmanage modifyvm "windows7-2" --acpi on
vboxmanage storageattach "windows7-2" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium "/home/cuckoo/vms/windows7-2.vdi"
vboxmanage storageattach "windows7" --storagectl "IDE Controller" --port 0 --device 1 --type dvddrive --medium windows7.iso
vboxmanage modifyvm windows7 --vrde on
