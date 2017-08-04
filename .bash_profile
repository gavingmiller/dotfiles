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

# vim installation
export PATH="$PATH:/opt/local/bin"

# work bin path
export PATH="$PATH:~/bin/cisco"

# global bin path
export PATH="$PATH:~/bin"

# vim
export PATH="$PATH:/usr/local/bin"

# git
export PATH="$PATH:/usr/local/git/bin"

# Set less output options
# Don't escape coloring
export LESS="-R"

# Include .bashrc and git-completion
source ~/.bashrc
source ~/bin/git-completion.bash

# nvm
export NVM_DIR="/Users/gmiller/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

