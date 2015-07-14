# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# set editor for bundle open
export EDITOR=vim
export BUNDLER_EDITOR=vim

# psql
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# vim installation
export PATH="/opt/local/bin:$PATH"

# local bin path
export PATH="./bin:$PATH"

# global bin path
export PATH="/Users/gmiller/bin:$PATH"

# Include scriptx -- bonus script folder for personal scripts
export PATH="./scriptx:$PATH"

# vim
export PATH="/usr/local/bin:$PATH"

# node
export PATH="/usr/local/share/npm/bin:$PATH"

# rabbit mq
export PATH="/usr/local/sbin:$PATH"

# mongodb
export PATH="/usr/local/mongodb/bin:$PATH"

# Set less output options
# Don't escape coloring
export LESS="-R"

# Export android home
export ANDROID_HOME="/usr/local/opt/android-sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Added neo4j to path
export PATH="/usr/local/neo4j/bin:$PATH"

# Include .bashrc and git-completion
source ~/.bashrc
source ~/bin/git-completion.bash

