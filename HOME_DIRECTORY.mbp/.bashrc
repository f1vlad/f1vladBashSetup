export PATH=$PATH:/usr/local/bin:/usr/local/git/bin
#export PS1="\e[0;33m[\u@\h \W]\$ \e[m "
export PATH=${PATH}:/Applications/android-sdk-mac/tools
source ~/.git-completion.sh

alias ll='ls -la'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi









    		#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


                                                                                                                                                                                                                                   
hostnick=${SF_SYSTEM_FUNC:+${SF_SYSTEM_FUNC/#slashdot-/sd-}}                                                                                                                                                                                
hostnick=${hostnick:-${HOSTNAME%.*}}

case "$TERM" in
        screen)
                PS1='\n\t #$WINDOW \u@${hostnick}:\[\e[31m\]\W\[\e[0m\]$(__git_ps1 " \[\e[35m\](%s)\[\e[0m\]")\$ '
                ;;
        xterm* | rxvt*)
                PS1='\n\t \u@${hostnick}:\[\e[31m\]\W\[\e[0m\]$(__git_ps1 " \[\e[35m\](%s)\[\e[0m\]")\$ '
                PROMPT_COMMAND='echo -ne "\033];${USER}@${hostnick}:${PWD/#$HOME/~} $(__git_ps1 \(%s\))\007"'
                export PROMPT_COMMAND
                ;;
        *)
                ;;
esac
export PS1

