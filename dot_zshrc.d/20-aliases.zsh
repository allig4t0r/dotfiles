alias bu="brew upgrade --greedy-latest"
alias brwe=brew
alias cat="bat --theme auto:system --theme-dark default --theme-light GitHub"
alias dev="cd ~/repos"
alias docs="cd ~/Documents"
alias editghost="vim ~/.config/ghostty/config"
alias editstarship="vim ~/.config/starship.toml"
alias ch=chezmoi
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias k=kubectl
alias la="eza -la"
alias ll="eza -l"
alias ls=eza
alias tf=terraform
alias tg=terragrunt

alias chz="chezmoi apply && exec zsh"
alias cha="chezmoi edit --apply"
alias chp="chezmoi git push"
alias chc="chezmoi -- git commit -m"

alias g=git
alias mkdir='mkdir -pv'
alias gl=serie
alias lg=lazygit
alias diff=difft

# Delete all remote tracking Git branches where the upstream branch has been deleted
alias git_prune="git fetch --prune && git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}' | xargs git branch -d"
