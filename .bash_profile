# fix bash warning for mac zshell
export BASH_SILENCE_DEPRECATION_WARNING=1

# Include .bashrc and git-completion
source $HOME/.bashrc
source $HOME/bin/git-completion.bash

# rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
if which rbenv &> /dev/null; then eval "$(rbenv init -)"; fi

# set editor for bundle open
export EDITOR=vim
export BUNDLER_EDITOR=vim

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Unbreak broken, non-colored terminal
export TERM='xterm-color'

# Set less output options
# Don't escape coloring
export LESS="-R"

# vim installation
# Prefer local installations first -- chefdk
export PATH="/opt/local/bin:/usr/local/bin:$PATH"

# global bin path
export PATH="$PATH:$HOME/bin"

# git
export PATH="$PATH:/usr/local/git/bin"

# nvm
export NVM_DIR="/Users/gmiller/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Brew openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Brew curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# Brew sbin
export PATH="/usr/local/sbin:$PATH"

# YVM
export PATH="/usr/local/opt/yvm/bin:$PATH"
