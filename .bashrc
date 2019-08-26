. $HOME/bin/bash_colors.sh

# Customized to pull in work specific configuration
if [ -f $HOME/.clio.bash ]; then
  . $HOME/.clio.bash
fi

# Bundler
alias bi='bundle install'
alias bu='bundle update'

alias catkey="cat $HOME/.ssh/id_rsa.pub"
alias copykey="catkey | pbcopy"

# useful stat
alias stat="stat -x"

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

CLIO_PROFILE=$HOME/.clio_profile
if test -f "$CLIO_PROFILE"; then
  echo "$CLIO_PROFILE exist"
  source $CLIO_PROFILE
fi
