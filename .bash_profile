# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export EDITOR=vim

function __grepvim() {
    echo $1;
    vim $(grep $1 -riIl * --include=\*.{php,tpl} --exclude-dir={vendor,runtime,web} "${@:2}");
}
alias grepvim="__grepvim"

function __grepcode() {
    echo $1;
    grep $1 * -niR --include=\*.{php,tpl} --exclude-dir={vendor,runtime,web} "${@:2}";
}
alias grepcode="__grepcode"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# default
#export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\ $ "

# custom original
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# my
txtlgreen='\[\033[01;32m\]'
txtdgreen='\[\033[32m\]'
txtreset='\[\033[00m\]'
txtblue='\[\033[01;34m\]'
txtorange='\[\033[33m\]'
customizetitle='\[\e]0;\h:\w\a\]'
export PS1="$customizetitle${debian_chroot:+($debian_chroot)}$txtlgreen\u@\h$txtreset $txtblue\w$txtreset$txtorange\$(parse_git_branch)$txtreset $ "

alias ssh="ssh -A"

# Start ssh-agent if not present (for keys on curent server)
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent`
    trap 'kill $SSH_AGENT_PID' EXIT
    ssh-add # add keys
    #ssh-add -L # list keys
fi

# turn off Ctrl + s XOFF (XON is Ctrl + q)
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

