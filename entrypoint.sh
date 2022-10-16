#!/bin/sh
set -e


echo ">> Creating tun interface"
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
echo ">> Starting AIX"
qemu-system-ppc64 -cpu POWER8 \
-machine pseries -m 4096 -serial stdio \
-drive file=/disk/hdisk0.qcow2,if=none,id=drive-virtio-disk0 \
-device virtio-scsi-pci,id=scsi \
-net nic,macaddr=56:44:45:30:31:38 -net tap,script=no,ifname=tap0 \
-device scsi-hd,drive=drive-virtio-disk0 \
-prom-env "boot-command=boot disk:" \
-prom-env "input-device=/vdevice/vty@71000000" \
-prom-env "output-device=/vdevice/vty@71000000"
