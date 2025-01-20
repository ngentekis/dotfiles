source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '/home/egent/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

export EDITOR=helix
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

SSH_ENV="$HOME/.ssh/agent-environment"

alias hx="helix"
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias lsa="ls -a -l"
alias sz="source ~/.zshrc"
alias hz="hx ~/.zshrc"
alias hh="hx ~/.config/hypr/hyprland.conf"
alias bemenu="bemenu-run --fb "#24273a" --ff "#cad3f5" --nb "#24273a" --nf "#cad3f5" --tb "#24273a" --hb "#24273a" --tf "#ed8796" --hf "#eed49f" --af "#cad3f5" --ab "#24273a""

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

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
		 [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] ||
			 [[ ${KEYMAP} == viins ]] ||
			 [[ ${KEYMAP} == '' ]] ||
			 [[ $1 = 'beam' ]];  then
		echo -ne '\e[5 q'
	fi
}

zle -N zle-keymap-select

echo -ne '\e[5 q'

preexec() {
	echo -ne '\e[5 q'
}

paste() {
	BUFFER+=$(cliphist list | head -n 1 | cliphist decode)
}

zle -N paste

bindkey -v
bindkey '^[[3~' delete-char
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^V' paste

# bun completions
[ -s "/home/egent/.bun/_bun" ] && source "/home/egent/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

plugins=(
	zsh-autosuggestions
)
