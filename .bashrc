# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# change prompt
parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[1;36m\][\[\e[m\]\[\e[1;36m\]\u\[\e[m\]\[\e[1;36m\]@\[\e[m\]\[\e[1;36m\]\h\[\e[m\]\[\e[1;36m\]]\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;31m\]\`parse_git_branch\`\[\e[m\] > "

# Bash history
HISTCONTROL=ignoredups:erasedups  # only store unique lines
HISTIGNORE="ls:exit:pwd:clear"    # ignore these commands
shopt -s cmdhist                  # save multi-line commands in history as single line
shopt -s histappend               # append to history each time
HISTSIZE=10000                    # change size of history
HISTFILESIZE=10000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# fix spelling errors for cd, only in interactive shell
shopt -s cdspell
#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"
# getting proper colors
export TERM="xterm-256color"

###########################################
##  User specific aliases and functions  ##
###########################################
source ~/.bash_alias
