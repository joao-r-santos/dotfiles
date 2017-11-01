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
alias activate="source activate"
alias deactivate="source deactivate"

alias insight="source activate insight"
alias gemini="source activate gemini_future_airings_feed"
alias metrics="source activate vantage_metrics_pipeline"


# Apply if using VirtualBox
alias atom="atom --use-gl=angle"
alias google-chrome="google-chrome --use-gl=angle"
alias google-chrome-stable="google-chrome-stable --use-gl=angle"

# autojump shortcuts
if [ -f /usr/share/autojump/autojump.sh ]; then
    source /usr/share/autojump/autojump.sh
fi

# powerline in bash
#if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
#    source /usr/share/powerline/bindings/bash/powerline.sh
#fi
