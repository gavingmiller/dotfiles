. $HOME/bin/bash_colors.sh

# Customized to pull in work specific configuration
if [ -f $HOME/.clio_profile ]; then
  . $HOME/.clio_profile
fi

# Source platform specific settings
. $HOME/.bash.platform

# Bundler
alias bi='bundle install'
alias bu='bundle update'

alias gimmie-aws-creds='gimme-aws-creds'

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

# Colorized man pages
# From http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
  env \
    LESS_TERMCAP_mb=$'\e[1;31m' \
    LESS_TERMCAP_md=$'\e[1;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;32m' \
    man "$@"
}

echo "Fix if you see this run during a command invocation. This should only run on first login."
eval "$(dev _hook)"
