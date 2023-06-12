# Zsh Plugins and Themes

Install the zsh with plugins and the powerlevel10k theme on Fedora.

## Zsh Installation

Install zsh using `dnf`.

```sh
sudo dnf install zsh
```

Either run `zsh` to configure it or copy `dotfiles/.zshrc` and `dotfiles/.aliasrc` from this repo to `~/.zshrc` and `~/.aliasrc`, respectively.

Install the chsh package using `dnf`.

```sh
sudo dnf install util-linux-user
```

Set zsh as the default shell.

```sh
chsh -s $(which zsh)
```

Log out or reboot the system.

## Zsh Plugins

Install the zsh-syntax-highlighting plugin using `dnf`.

```sh
sudo dnf install zsh-syntax-highlighting
```

Install the zsh-autosuggestions plugin using `dnf`.

```sh
sudo dnf install zsh-autosuggestions
```

Install the zsh-history-substring-search plugin through git.

```sh
cd /usr/share
sudo git clone https://github.com/zsh-users/zsh-history-substring-search.git
```

Edit the `~/.zshrc` file to add the following at the end. If using `dotfiles/.zshrc` from this repo, this is already included.

```bash
# fish style syntax highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# fish style autosuggestions
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# fish style history substring search
if [ -f /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  # bind UP and DOWN arrow keys to history substring search
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi
```

## Powerlevel10k Theme

Install the powerlevel10k theme through git.

```sh
cd /usr/share
sudo git clone https://github.com/romkatv/powerlevel10k.git
```

Edit the `~/.zshrc` file to add the following at the end. If using `dotfiles/.zshrc` from this repo, this is already included.

```bash
# powerlevel10k theme
if [ -f /usr/share/powerlevel10k/powerlevel10k.zsh-theme ]; then
  source /usr/share/powerlevel10k/powerlevel10k.zsh-theme
  [ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
fi
```

Configure the powerlevel10k theme.

```sh
p10k
```

Alternatively, copy `dotfiles/.p10k.zsh` to `~/.p10k.zsh`.
