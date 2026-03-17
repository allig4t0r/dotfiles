#!/usr/bin/env zsh

export FZF_DEFAULT_OPTS="--preview 'tree -C {} | head -20'"

zp() {
  local dir
  dir=$(zoxide query -l | grep -i project | fzf)
  [ -n "$dir" ] && z "$dir"
}

zr() {
  local dir
  dir=$(zoxide query -l | sort -k2 -rn | fzf)
  [ -n "$dir" ] && z "$dir"
}

zgit() {
  local dir
  dir=$(zoxide query -l | xargs -I {} sh -c 'test -d {}/.git && echo {}' | fzf)
  [ -n "$dir" ] && z "$dir"
}

zi() {
  local dir
  dir=$(zoxide query -l | head -50 | fzf)
  [ -n "$dir" ] && z "$dir"
}

zil() {
  local dir
  dir=$(zoxide query -l | fzf --bind 'change:reload:zoxide query -l {q}') && z "$dir"
}
