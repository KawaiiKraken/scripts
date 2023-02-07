#!/bin/bash
# debugging
set -x

# load variables we defined
#source "/etc/libvirt/hooks/kvm.conf"

# stop display manager ???
xdotool key ctrl+\shift+super+q 2>/dev/null &

# Unbind VTconsoles
#echo 0 > /sys/class/vtconsole/vtcon0/bind
#echo 0 > /sys/class/vtconsole/vtcon1/bind

# Unbind EFI-framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Avoid race condition
sleep 8

# Unload Nvidia
modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r drm_kms_helper
modprobe -r nvidia
modprobe -r i2c_nvidia_gpu
modprobe -r drm
modprobe -r nvidia_uvm

# unbind gpu
virsh nodedev-detach pci_0000_23_00_0
virsh nodedev-detach pci_0000_23_00_1

# load vfio
#modprobe vfio
#modprobe vfio_pci
#modprobe vfio_iommu_type1



# Unload Nvidia
modprobe nvidia_drm
modprobe nvidia_modeset
modprobe drm_kms_helper
modprobe nvidia
modprobe i2c_nvidia_gpu
modprobe drm
modprobe nvidia_uvm

#echo 1 > /sys/class/vtconsole/vtcon0/bind
#echo 1 > /sys/class/vtconsole/vtcon1/bind

startx
