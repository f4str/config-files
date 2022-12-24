# Firefox Codecs

Install Firefox codecs on Fedora for videos to work.

## Install FFmpeg

Enable the RPM fusion repos.

```sh
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Install ffmpeg using `dnf`.

```sh
sudo dnf install ffmpeg
```

## Install H264 Plugin

Enable the OpenH264 repo.

```sh
sudo dnf config-manager --set-enabled fedora-cisco-openh264
```

Install the OpenH264 plugin.

```sh
sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264
```
