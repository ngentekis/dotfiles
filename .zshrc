HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '/home/egent/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

export EDITOR=helix

alias hx="helix"
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias lsa="ls -a -l"
alias sz="source ~/.zshrc"
alias hz="hx ~/.zshrc"

alias z="zellij"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

PS1='%m %1d$ '

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

paste() {
	BUFFER+=$(cliphist list | head -n 1 | cliphist decode)
}

zle -N paste

bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^V' paste
