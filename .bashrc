# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# If set, minor errors in the spelling of a directory component in a
# cd command will be corrected. The errors checked for are transposed
# characters, a missing character, and a character too many.
shopt -s cdspell

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Additional customizations

# added by Miniconda2 installer
export PATH="/home/joao/miniconda2/bin:$PATH"

# case insensitive tab completion
set completion-ignore-case on

# some ls aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
#alias ll='ls -alF'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
# sort by modification time
alias lt='ls -ltr'
alias lth='ls -ltrh'
alias lta='ls -ltrA'
# sort by size
alias lS='ls -lSr'
alias lSh='ls -lSrh'
alias lsh='ls -lSrh'
alias l='ls -CF'

alias df='df -h'
alias dus='du -hs * | sort -h'
alias h='history | grep -i'

alias purge='rm -i *~ .*~'
alias rm='rm -i'
alias pdf='evince'

alias vimsplit='vim -O'
alias gvimsplit='gvim -O'
alias regexfind='find -regextype posix-extended -regex'
# alias rmpyc='find . -type f -name "*.pyc" | xargs rm -f || true'
alias rmpyc='find . -type f -name "*.pyc" -print -delete'

# autoformatter
alias black100="black --line-length 100 --skip-string-normalization"

alias savesession='pwd >> ~/terminal_sessions'
cdsession() {
    if [ -z "${1}" ]; then
        sed '/^#/d' ~/terminal_sessions | sed '/^$/d'
    else
        cd "$(sed '/^#/d' ~/terminal_sessions | sed '/^$/d' | grep -i "${1}" | sed '1!d')"
    fi
}
sendtowin() {
    rsync -avz "${1}" ~/Windows/Transfer/
}

# Add 'fuck' command to correct your previous console command
if command -v thefuck 1>/dev/null 2>&1; then
    eval $(thefuck --alias)
fi
#eval $(thefuck --alias --enable-experimental-instant-mode)

# Conda environments
alias condaactivate='source activate'
alias condadeactivate='source deactivate'
# alias insight='source activate insight'


# Apply if using VirtualBox
alias atom='atom --use-gl=angle'
alias google-chrome='google-chrome --use-gl=angle'
alias google-chrome-stable='google-chrome-stable --use-gl=angle'

# autojump shortcuts
if [ -f /usr/share/autojump/autojump.sh ]; then
    source /usr/share/autojump/autojump.sh
fi

if [ -f ~/.schireson/bash_schireson ]; then
    . ~/.schireson/bash_schireson
fi

# powerline in bash
#if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
#    source /usr/share/powerline/bindings/bash/powerline.sh
#fi
