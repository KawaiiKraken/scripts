#!/bin/bash
export PS1="[\u \W]\\$ \[$(tput sgr0)\]"
export PATH="$PATH:/home/kraken/statusbar:/usr/bin/"
alias vim="nvim"
if [$SSH_CLIENT -eq ""] 2>/dev/null
then startx
else echo "connected over ssh"
fi

