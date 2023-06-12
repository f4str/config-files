# Powerline Theme

Install the powerline theme for bash, vim, and tmux on Fedora.

## Bash Installation

Install the necessary plugins using `dnf`.

```sh
sudo dnf install powerline powerline-fonts
```

Edit the `~/.bashrc` file to add the following at the end. If using `dotfiles/.bashrc` from this repo, this is already included.

```bash
if [ -f $(which powerline-daemon) ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi
```

## Vim Installation

Install the necessary plugins using `dnf`.

```sh
sudo dnf install vim-powerline
```

Edit the `~/.vimrc` file to add the following at the end. If using `dotfiles/.vimrc` from this repo, this is already included.

```vim
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256
```

## Tmux Installation

Install the necessary plugins using `dnf`.

```sh
sudo dnf install tmux-powerline
```

Edit the `~/.tmux.conf` file to add the following at the end. If using `dotfiles/.tmux.conf` from this repo, this is already included.

```bash
source "/usr/share/tmux/powerline.conf"
```
