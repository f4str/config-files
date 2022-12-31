# Btrfs Configuration

Subvolume layout and options for btrfs on Fedora.

## Subvolumes

Recommended btrfs subvolume layout for creating snapshots using Timeshift.

| Subvolume | Mount |
| -- | -- |
| @ | / |
| @home | /home |
| @cache | /var/cache |
| @log | /var/log |

## Mount Options

Recommended options in the file system table (`/etc/fstab`) for each of the btrfs subvolumes.

```sh
noatime,compress=zstd:1,space_cache=v2,ssd,subvol=@
```

## Disable Copy-on-Write on VM Images

If using Virtual Machine Manager (virt-manager) disable copy-on-write for the `/var/lib/libvirt/images` directory where virtual machine images are stored.

```sh
sudo chattr -R +C /var/lib/libvirt/images
```

If using GNOME Boxes, disable copy-on-write for the `~/.local/share/gnome-boxes/images` directory where virtual machine images are stored.

```sh
sudo chattr -R +C ~/.local/share/gnome-boxes/images
```
