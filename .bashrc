# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
# linux用
alias vi="/usr/bin/vim"
alias grep="grep -n --color=auto"
alias ll='ls -al'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ex="exit"
alias reload='. ~/.bashrc'

# git
alias gt="git"
alias gp="git pull --prune"

# rails
alias be="bundle exec"
alias bi="bundle install"
alias rspec='NO_RCOV=true bundle exec rspec'
alias rs='bin/parallel_rspec spec/'
alias rc='bundle exec rubocop $( git diff --name-only --diff-filter=AMRC | paste -s - )  --cache false'
alias rc_all='bundle exec rubocop --cache false'
alias sv='bin/rails s -b 0.0.0.0'

# prj
alias it='./script/test/exec_remote_integration_test.rb -S'
alias seed_all='bundle exec rake parallel:seed_all'

# console setting
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\e[1;33m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
