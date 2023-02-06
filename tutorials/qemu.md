# QEMU and Virtualization

Install QEMU and Virtual Machine Manager (virt-manager) on Fedora for running virtual machine.

## Installation

Install the packages using the virtualization dnf group.

```sh
sudo dnf group install --with-optional virtualization
```

Enable and start the virtualization daemon.

```sh
sudo systemctl enable --now libvirtd
```

Install the spice agent to share clipboards with the virtual machine.

```sh
sudo dnf install spice-vdagent
```

## User Groups

Add the current user to the necessary virtualization groups. If the group does not exist, then you can ignore it.

```sh
sudo usermod -aG libvirt $USER
sudo usermod -aG libvirt-qemu $USER
sudo usermod -aG kvm $USER
sudo usermod -aG input $USER
sudo usermod -aG disk $USER
```

## Disable Copy-on-Write

If using btrfs, disable copy-on-write for the `/var/lib/libvirt/images` directory where virtual machine images are stored.

```sh
sudo chattr -R +C /var/lib/libvirt/images
```

## Remove GNOME Boxes

Optionally, remove GNOME Boxes now that Virtual Machine Manager will be used.

```sh
sudo dnf remove gnome-boxes
```

If not automatically cleaned, delete the directory.

```sh
rm -rf ~/.local/share/gnome-boxes
```
