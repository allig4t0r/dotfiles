for ZSH_FILE in "${ZDOTDIR:-$HOME}/.zshrc.d/"*.zsh(N); do
  source "${ZSH_FILE}"
done

# autoload -Uz compinit
# compinit

source $ZSH/oh-my-zsh.sh

if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi