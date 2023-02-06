# GNOME Extensions and Applications

Install recommended GNOME extensions and applications.

## GNOME Tweaks

Install the GNOME Tweaks application.

```sh
sudo dnf install gnome-tweaks
```

Open the application. Change `Legacy Applications` to `Adwaita-dark`. Adjust other settings accordingly.

## Enable Flathub

Enable the Flathub repo.

```sh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Remove the Fedora flatpak repo.

```sh
flatpak remote-delete fedora
```

Install the Flatseal application.

```sh
flatpak install flathub com.github.tchx84.Flatseal
```

## GNOME Extensions

Install the Extension Manager

```sh
flatpak install flathub com.mattjakeman.ExtensionManager
```

Using Extension Manager, install the recommended extensions.

* Alphabetical App Grid
* AppIndicator and KStatusNotifier Support
* Blur my Shell
* Extension list
* Fullscreen Avoider
* Lock Keys
* Media Controls
* Removable Drive Menu

## GNOME Applications

Install the recommended applications either as an RPM or flatpak.

| Name | RPM | Flatpak |
| -- | -- | -- |
| GNOME Editor | gedit | org.gnome.gedit |
| GNOME File Roller | file-roller | org.gnome.FileRoller |
| GNOME Web | N/A | org.gnome.Epiphany |
| Drawing | drawing | com.github.maoschanz.drawing |
| DConf Editor | dconf-editor | ca.desrt.dconf-editor |
| Apostrophe | apostrophe | org.gnome.gitlab.somas.Apostrophe |
| Bottles | bottles | com.usebottles.bottles |
