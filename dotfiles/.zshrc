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

# set editor
export EDITOR=vim
export VISUAL=vim

# themes
autoload -U compinit colors zcalc
compinit -d
colors

# color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R


###########
# Aliases #
###########

# add color
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls aliases
alias l='ls -F'
alias la='ls -AF'
alias ll='ls -lFh'
alias lla='ls -lAFh'
alias lr='ls -RF'

# confirmations
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias ln='ln -iv'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'
alias df='df -h'

# shortcuts
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias zshrc='${EDITOR} ~/.zshrc'

# archive extractor
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# python virtual environment activator
activate() {
  local possible_dirs=(venv env .venv .env)
  for dir in ${possible_dirs[@]}; do
    file="${dir}/bin/activate"
    if [ -f $file ]; then
      . ${file}
      return
    fi
  done
  echo "virtual environment not found"
}


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


###################
# Terminal Window #
###################

# Set terminal window and tab/icon title
#
# usage: title short_tab_title [long_window_title]
#
# See: http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
# Fully supports screen and probably most modern xterm and rxvt
# (In screen, only short_tab_title is used)
function title {
  emulate -L zsh
  setopt prompt_subst

  [[ "$EMACS" == *term* ]] && return

  # if $2 is unset use $1 as default
  # if it is set and empty, leave it as is
  : ${2=$1}

  case "$TERM" in
    xterm*|putty*|rxvt*|konsole*|ansi|mlterm*|alacritty|st*)
      print -Pn "\e]2;${2:q}\a" # set window name
      print -Pn "\e]1;${1:q}\a" # set tab name
      ;;
    screen*|tmux*)
      print -Pn "\ek${1:q}\e\\" # set screen hardstatus
      ;;
    *)
    # Try to use terminfo to set the title
    # If the feature is available set title
    if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
      echoti tsl
      print -Pn "$1"
      echoti fsl
    fi
      ;;
  esac
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m:%~"

# Runs before showing the prompt
function mzc_termsupport_precmd {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

# Runs before executing the command
function mzc_termsupport_preexec {
  [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return

  emulate -L zsh

  # split command into array of arguments
  local -a cmdargs
  cmdargs=("${(z)2}")
  # if running fg, extract the command from the job description
  if [[ "${cmdargs[1]}" = fg ]]; then
    # get the job id from the first argument passed to the fg command
    local job_id jobspec="${cmdargs[2]#%}"
    # logic based on jobs arguments:
    # http://zsh.sourceforge.net/Doc/Release/Jobs-_0026-Signals.html#Jobs
    # https://www.zsh.org/mla/users/2007/msg00704.html
    case "$jobspec" in
      <->) # %number argument:
        # use the same <number> passed as an argument
        job_id=${jobspec} ;;
      ""|%|+) # empty, %% or %+ argument:
        # use the current job, which appears with a + in $jobstates:
        # suspended:+:5071=suspended (tty output)
        job_id=${(k)jobstates[(r)*:+:*]} ;;
      -) # %- argument:
        # use the previous job, which appears with a - in $jobstates:
        # suspended:-:6493=suspended (signal)
        job_id=${(k)jobstates[(r)*:-:*]} ;;
      [?]*) # %?string argument:
        # use $jobtexts to match for a job whose command *contains* <string>
        job_id=${(k)jobtexts[(r)*${(Q)jobspec}*]} ;;
      *) # %string argument:
        # use $jobtexts to match for a job whose command *starts with* <string>
        job_id=${(k)jobtexts[(r)${(Q)jobspec}*]} ;;
    esac

    # override preexec function arguments with job command
    if [[ -n "${jobtexts[$job_id]}" ]]; then
      1="${jobtexts[$job_id]}"
      2="${jobtexts[$job_id]}"
    fi
  fi

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title '$CMD' '%100>...>$LINE%<<'
}

autoload -U add-zsh-hook
add-zsh-hook precmd mzc_termsupport_precmd
add-zsh-hook preexec mzc_termsupport_preexec


###########
# Plugins #
###########

# fish style syntax highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# fish style autosuggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# fish style history substring search
if [ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  # bind UP and DOWN arrow keys to history substring search
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# Powerlevel10k theme
if [ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  [ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
fi
