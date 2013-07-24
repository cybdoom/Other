#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

###########-SHELL ALIASES-#############
alias ll='ls -l --color=auto'         #
alias ls='ls -l --color=auto'         #
alias sublime_text='sublime_text &'   #
#######################################

############-GIT ALIASES-##############
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias go='git checkout'
alias gd='git diff'
alias gb='git branch'
alias gpsh='git push'
alias gpll='git pull'
alias gl='git log'
#######################################

PS1="\e[1;31m# \w #\e[m "
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

cd ~/id.net
