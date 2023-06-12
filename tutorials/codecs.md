# Multimedia Codecs

Install all multimedia codecs on Fedora for audio and video to work for the Firefox RPM. This is not needed if using the Firefox flatpak.

## RPM Fusion

If you have not already, enable the RPM fusion repos.

```sh
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

## Multimedia Libraries

Install the GStreamer framework.

```sh
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
```

Install the LAME encoder.

```sh
sudo dnf install lame\* --exclude=lame-devel
```

Update the Multimedia group.

```sh
sudo dnf group upgrade --with-optional Multimedia
```

## FFmpeg

Install the FFmpeg framework.

```sh
sudo dnf install ffmpeg
```

## H264

Enable the OpenH264 repo.

```sh
sudo dnf config-manager --set-enabled fedora-cisco-openh264
```

Install the OpenH264 plugin.

```sh
sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264
```

## Additional Codecs

Install the extra plugins for GStreamer.

```sh
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```

Install extra sound and video plugins.

```sh
sudo dnf groupupdate sound-and-video
```

## Hardware Accelerated Codecs

If you are using an Intel GPU, install the corresponding VAAPI driver.

```sh
sudo dnf install intel-media-driver
```

If you are using and AMD GPU, swap out the proprietary Mesa drivers with the open source variants with VAAPI support.

```sh
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
```

If you are using an NVIDIA GPU, install the VAAPI driver.

```sh
sudo dnf install nvidia-vaapi-driver
```
