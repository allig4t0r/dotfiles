# brew
alias bu="brew upgrade --greedy-latest"
alias brwe=brew

# random
alias dev="cd ~/repos"
alias docs="cd ~/Documents"
alias editghost="vim ~/.config/ghostty/config"
alias editstarship="vim ~/.config/starship.toml"
alias k=kubectl

# system
alias cat="bat --theme auto:system --theme-dark default --theme-light GitHub"
alias mkdir='mkdir -pv'
alias la="eza -la"
alias ll="eza -l"
alias ls=eza

# git
alias g=git
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gl=serie
alias lg=lazygit
alias diff=difft

# terraform
alias tf=terraform
alias tg=terragrunt
alias ttf="task tf"

# chezmoi
alias ch=chezmoi
alias chz="chezmoi apply && exec zsh"
alias cha="chezmoi edit --apply"
alias chp="chezmoi git push"
alias chc="chezmoi -- git commit -m"
alias che="chezmoi edit"

# Delete all remote tracking Git branches where the upstream branch has been deleted
alias git_prune="git fetch --prune && git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}' | xargs git branch -d"
