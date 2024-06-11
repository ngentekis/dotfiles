# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ngent/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# aliases
alias hx="helix"
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias lsa="ls -a -l"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

PS1='%m %1d$ '
