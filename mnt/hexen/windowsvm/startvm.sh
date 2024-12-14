#!/bin/bash

THIS_DIR=$(dirname ${BASH_SOURCE[0]})

	#-cdrom ${THIS_DIR}/Win10_22H2_English_x64v1.iso \

qemu-system-x86_64 \
	-hda ${THIS_DIR}/win10.img \
	-boot c \
	-enable-kvm \
	-cpu host \
	-smp 24 \
	-m 32G \
	-machine type=q35,accel=kvm \
	-object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 \
	-netdev tap,br=br0,id=n1,helper=/usr/lib/qemu/qemu-bridge-helper \
	-device rtl8139,netdev=n1 \
	-display vnc=0.0.0.0:2 \
	-monitor tcp:0.0.0.0:6002,server,nowait

