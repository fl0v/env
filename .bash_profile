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

alias ssh="ssh -A"

# Start ssh-agent if not present (for keys on curent server)
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent`
    trap 'kill $SSH_AGENT_PID' EXIT
    ssh-add # add keys
fi

# turn off Ctrl + s XOFF (XON is Ctrl + q)
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

