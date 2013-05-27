# Include .bashrc and git-completion
source ~/.bashrc
source ~/bin/git-completion.bash

# Set SVN editor
export SVN_EDITOR=vim
export EDITOR=vim

# Scripting paths
export PATH="$PATH:/Users/gavinmiller/Dropbox/Personal/projects/scripts"
export PATH="~/bin:$PATH"

# MacPorts Installer addition on 2010-10-31_at_15:03:17: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# PostgreSQL
export PATH="/opt/local/lib/postgresql83/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# android
export PATH="$HOME/android-sdks/tools:$HOME/android-sdks/platform-tools:$PATH"

# mysql
export PATH="/usr/local/mysql/bin:$PATH"

# vim
export PATH="/usr/local/bin:$PATH"

# Ruby Falcon patch settings
# Source: https://gist.github.com/1688857
export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

# Relative pathing for script/bin in rails projects
export PATH="./script:$PATH"
export PATH="./bin:$PATH"

# PostgreSQL configuration
export PATH="$HOME/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
