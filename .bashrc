[[ $- =~ i ]] || return 0

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

# ignorespace and ignoredups
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=5000

export GPG_TTY=$(tty)

bind 'set bell-style none'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if command -V zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
    alias cd='z'
    alias cdf='zi'
fi

if command -V lsd >/dev/null 2>&1; then
    alias ls='lsd'
fi
alias ll='ls -Al'

if command -V fzf >/dev/null 2>&1; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

export VISUAL="vim"
if command -V lsd >/dev/null 2>&1; then
    export VISUAL="nvim"
    alias nv='nvim'
fi

alias grep='grep --color=auto'

alias git_cap='git add -u && git commit --amend --no-edit && git push -f'

mc ()
{
  mkdir $1 && cd $1  
}
