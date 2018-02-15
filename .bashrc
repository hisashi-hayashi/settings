# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# alias
alias ll='ls -al'
alias grep="grep -n --color=auto"
alias be="bundle exec"
alias bi="bundle install"
alias gt="git"
alias gp="git pull --prune"
alias ex="exit"
alias reload='. ~/.bashrc'
alias rc='bundle exec rubocop $( git diff --name-only --diff-filter=AMRC | paste -s - )  --cache false'
alias rc_all='bundle exec rubocop --cache false'
alias rs='bin/parallel_rspec spec/'
alias sv='bin/rails s -b 0.0.0.0'
alias rspec='NO_RCOV=true bin/rspec'

# console setting
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# git
GIT_PS1_SHOWDIRTYSTATE=true
PS1="\[\033[1;32m\]\$(date +%Y/%m/%d_%H:%M:%S)\[\033[0m\] \[\033[33m\]\H:\w\n\[\033[0m\][\u@ \W]\[\033[31m\]\$(__git_ps1)\[\033[00m\]\$ "
