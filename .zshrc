# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/boris/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall


# prompt
prompt walters

# Adding local bin to path
export PATH=$PATH:~/.local/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:~/.nvm/versions/node/v12.7.0/bin
export PATH=$PATH:~/git/binaryen/bin

# Aliases
alias ls='ls --color=auto'
alias lsa='ls --color=auto -a'
alias grep='grep --color=auto'
alias new='. new'
alias rmi='rm -I'
alias diff='diff --color=auto'
alias adog='git log --all --decorate --oneline --graph'

# Disable Ctrl+s. Can be fixed by using Ctrl+q
stty -ixon

# title with current working directory
case $TERM in
	xterm*)
		precmd () {print -Pn "\e]0;%~\a"}
		;;
esac

# some basic key bindings
typeset -A key
key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

[[ -n "$key[Home]"	]] && bindkey -- "$key[Home]"		beginning-of-line
[[ -n "$key[End]"	]] && bindkey -- "$key[End]"		end-of-line
[[ -n "$key[Insert]"	]] && bindkey -- "$key[Insert]"		overwrite-mode
[[ -n "$key[Backspace]"	]] && bindkey -- "$key[Backspace]"	backward-delete-char
[[ -n "$key[Delete]"	]] && bindkey -- "$key[Delete]"		delete-char
[[ -n "$key[Up]"	]] && bindkey -- "$key[Up]"		up-line-or-history
[[ -n "$key[Down]"	]] && bindkey -- "$key[Down]"		down-line-or-history
[[ -n "$key[Left]"	]] && bindkey -- "$key[Left]"		backward-char
[[ -n "$key[Right]"	]] && bindkey -- "$key[Right]"		forward-char

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init () {
		echoti smkx
	}
function zle-line-finish () {
	echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish
fi

function zle-line-init zle-keymap-select {
	RPS1="${${KEYMAP/vicmd/-- VIM --}/(main|viins)/-- INSERT --}"
	RPS2=$RPS1
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Vim runtime set up
#export VIMRUNTIME=$HOME/.vim

# Ranger-cd function sourcing
#source /home/boris/Documents/bash_automatic_cd.sh

# Python Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
#source ~/.local/bin/virtualenvwrapper.sh

# Default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# NVM
export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
