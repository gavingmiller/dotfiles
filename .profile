# Include .bashrc and git-completion
source .bashrc
source ~/bin/git-completion.bash

# Set SVN editor
export SVN_EDITOR=mvim
export EDITOR=mvim

export PATH=$PATH:/Users/gavinmiller/Documents/Dropbox/projects/scripts

# MacPorts Installer addition on 2010-10-31_at_15:03:17: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# PostgreSQL
export PATH=/opt/local/lib/postgresql83/bin:$PATH

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# android
export PATH="$HOME/android-sdks/tools/:$HOME/android-sdks/platform-tools/:$PATH"

# mysql
export PATH=/usr/local/mysql/bin:$PATH

# vim
export PATH=/usr/local/bin:$PATH
