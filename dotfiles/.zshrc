###########
# Options #
###########

# shell options
setopt nobeep                    # disable beep
setopt nocorrect                 # disable auto correct mistakes
setopt extendedglob              # extended globbing
setopt nocaseglob                # case insensitive globbing
setopt rcexpandparam             # array expansion with parameters
setopt nocheckjobs               # don't warn about running processes when exiting
setopt numericglobsort           # sort filenames numerically when it makes sense
setopt appendhistory             # immediately append history instead of overwriting
setopt histignorealldups         # if a new command is a duplicate, remove the older one
setopt autocd                    # if only directory path is entered, cd there.
setopt inc_append_history        # save commands are added to the history immediately
setopt histignorespace           # don't save commands that start with space

# autocomplete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                         # automatically find new executables in path 
# speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

# autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -a zsh/mapfile mapfile


###############
# Keybindings #
###############

bindkey -e
bindkey '^[[7~' beginning-of-line                        # Home key
bindkey '^[[H' beginning-of-line                         # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line         # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                              # End key
bindkey '^[[F' end-of-line                               # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                           # Insert key
bindkey '^[[3~' delete-char                              # Delete key
bindkey '^[[C'  forward-char                             # Right key
bindkey '^[[D'  backward-char                            # Left key
bindkey '^[[5~' history-beginning-search-backward        # Page up key
bindkey '^[[6~' history-beginning-search-forward         # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                              # ctrl+right
bindkey '^[Od' backward-word                             # ctrl+left
bindkey '^[[1;5C' forward-word                           # ctrl+right
bindkey '^[[1;5D' backward-word                          # ctrl+left
bindkey '^H' backward-kill-word                          # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                      # Shift+tab undo last action


###########
# Aliases #
###########

if [ -f ~/.aliasrc ]; then
    source ~/.aliasrc
fi


###########
# Plugins #
###########

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
# powerlevel10k theme
if [ -f /usr/share/powerlevel10k/powerlevel10k.zsh-theme ]; then
  source /usr/share/powerlevel10k/powerlevel10k.zsh-theme
  [ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
fi

