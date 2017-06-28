# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#cowsay
#cowsay "Welcome $USER! It's now $(date '+%A %B %d %Y %r'), be good hacker, I LOVE U azzamsa"

#byobu-enable

echo "╦ ╦┌─┐┬  ┬  ┌─┐  ┌─┐┌─┐┌─┐┌─┐┌┬┐┌─┐┌─┐"
echo "╠═╣├┤ │  │  │ │  ├─┤┌─┘┌─┘├─┤│││└─┐├─┤"
echo "╩ ╩└─┘┴─┘┴─┘└─┘  ┴ ┴└─┘└─┘┴ ┴┴ ┴└─┘┴ ┴"
echo "Welcome $USER! It's now $(date '+%A %B %d %Y %r'), be a good hacker, I LOVE U azzamsa"



# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a path5Fname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export HISTTIMEFORMAT="%d/%m/%y %T "

if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

#ini untuk powerline yang systemwide
if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
fi
#untuk xterm colour(emacs support)
export TERM=xterm-256color
 
export DEBFULLNAME="Azzam Syawqi Aziz"
export DEBEMAIL="oktinastuzi@gmail.com"

#ini untuk go language.
export GOPATH=“/home/azzamsa/project”
export PATH=$PATH:$GOPATH/bin 

#ini masalah DB2 setup tidak bisa diterminal karena javanya.
#export XAUTHORITY=~/.Xauthority
#xhost +local:all
#http://stackoverflow.com/questions/10165761/java-cant-connect-to-x11-window-server-using-localhost10-0-as-the-value-of-t
export DISPLAY=:0

#emacs client configuration 17.10.16 10:31 AM
export VISUAL='emacsclient --alternate-editor='
export EDITOR='emacsclient --alternate-editor='



#Mon Oct 31 16:49:11 WIB 2016
#adding the autojump sources
. /usr/share/autojump/autojump.sh
. /usr/share/autojump/autojump.bash

#aliases 01.11.16 5:44 Am
alias sudo='sudo '

#aliases 01.11.16 6:12 Am
export ALTERNATE_EDITOR=""

#-----------------------------------**Batas**-----------------------------------------------------------
#[ -r /home/azzamsa/.byobu/prompt ] && . /home/azzamsa/.byobu/prompt   #byobu-prompt#

function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi


#26.12.2016 4:36 PM // ini untuk powerline bash

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /home/azzamsa/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

#22.03.2017 10:45 AM //untuk save big history
#http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#26.03.2017 3:34 AM // export for tmux
export TERM=screen-256color-bce

#04.05.2017 10:30 AM //java ugly font
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

export PATH=$PATH:/home/azzamsa/.config/composer/vendor/bin

cdn () { pushd .; for ((i=1; i<=$1; i++)); do cd ..; done; pwd; }

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/azzamsa/.sdkman"
[[ -s "/home/azzamsa/.sdkman/bin/sdkman-init.sh" ]] && source "/home/azzamsa/.sdkman/bin/sdkman-init.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
