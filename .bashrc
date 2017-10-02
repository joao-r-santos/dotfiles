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
alias lt='ls -ltr'
alias lta='ls -ltrA'
alias l='ls -CF'

alias df='df -h'
alias h='history | grep'

alias purge='rm -i *~ .*~'
alias rm='rm -i'
alias pdf='evince'

alias vimsplit="vim -O"
alias nopyc="find . -name '*.pyc' | xargs rm -f || true"


# Conda environments
alias deactivate="source deactivate"

alias insight="source activate insight"
alias deinsight="source deactivate insight"
alias gemini="source activate gemini_future_airings_feed"
alias degemini="source deactivate gemini_future_airings_feed"


# Apply if using VirtualBox
alias atom="atom --use-gl=angle"
alias google-chrome="google-chrome --use-gl=angle"
alias google-chrome-stable="google-chrome-stable --use-gl=angle"

# autojump shortcuts
. /usr/share/autojump/autojump.sh
