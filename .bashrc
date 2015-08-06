. ~/bin/bash_colors.sh

# Unbreak broken, non-colored terminal
export TERM='xterm-color'

# Bundler
alias bi='bundle install'
alias bu='bundle update'

# Misc
alias sync_date='ntpdate -b -u pool.ntp.org'

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Customize the command line
function minutes_since_last_commit {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1`
  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  echo $minutes_since_last_commit
}

grb_git_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
    if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
      local COLOR=${RED}
    elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
      local COLOR=${YELLOW}
    else
      local COLOR=${GREEN}
    fi
    local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"
    # The __git_ps1 function inserts the current git branch where %s is
    local GIT_PROMPT=`__git_ps1 "(${SINCE_LAST_COMMIT}|${VIOLET}%s${NORMAL})"`
    echo ${GIT_PROMPT}
  fi
}

job_count() {
  local count="$(jobs | wc -l)"
  if [ "$count" -ne 0 ]; then
    local prompt="(jobs:$count)"
    echo ${prompt}
  fi
}

current_time() {
  echo `date "+%H:%M:%S"`
}

# OS specific configurations
# Hat tip to https://github.com/mokhan
OS=$(uname)
if [ "$OS" = "Linux" ]
then
  source ~/.bash/linux/aliases
  PS1="\t ${RED}\h${NORMAL} \W\$(grb_git_prompt)\$(job_count)\$ "
elif [ "$OS" = "Darwin" ]
then
  source ~/.bash/osx/aliases
  PS1="\t \W\$(grb_git_prompt)\$(job_count)\$ "
fi

