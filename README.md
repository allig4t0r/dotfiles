
Heavily influenced by https://github.com/9seconds/dotfiles/

```
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | zsh
brew bundle install
chezmoi init
chezmoi apply

maybe:
chmod +x ~/.config/git/hooks/pre-commit
```