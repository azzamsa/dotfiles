alias copy='xclip -sel clip'

#27.10.2015 10:33 AM
alias e='emacsclient --alternate-editor='
#16.04.2017 12:21 AM // new emacs conf
#https://github.com/bbatsov/prelude
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias vim='emacsclient -t'
alias vi='emacsclient -t'

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'


#Tue Nov  1 17:48:12 WIB 2016
alias sudo='sudo '

#14.12.2016 6:29 AM
alias in='sudo apt-get install'

#pear untuk php 25.03.2017 10:33 AM
alias pear='/home/azzamsa/pear/bin/pear'

#25.03.2017 10:33 AM // ini udah ngetit pake emacsclient
alias phbea='php_beautifier'

alias sbcl='rlwrap sbcl'
