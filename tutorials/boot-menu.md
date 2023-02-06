# Boot Menu

Enable the GRUB boot menu, set the boot timeout, and disable the plymouth splash.

## Enable GRUB Menu

Unset the flag to hide the GRUB menu.

```sh
sudo grub2-editenv - unset menu_auto_hide
```

## Set GRUB Timeout

Edit the default GRUB config file to reduce the timeout.

```sh
sudo vim /etc/default/grub
```

Modify the `GRUB_TIMEOUT` variable. The unit is in seconds.

```diff
- GRUB_TIMEOUT=5
+ GRUB_TIMEOUT=3
```

Regenerate the GRUB config.

```sh
sudo grub2-mkconfig -o /etc/grub2.cfg
sudo grub2-mkconfig -o /etc/grub2-efi.cfg
```

## Disable Plymouth splash

Optionally to always show the console when booting, change the plymouth theme.

```sh
sudo plymouth-set-default-theme -R details
```

This will take some time as it needs to rebuild the initramfs.
