#!/bin/bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use stable --silent

export PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u \[\033[01;34m\]\w \$\[\033[00m\] '
export PATH="~/.cargo/bin:${PATH}"
