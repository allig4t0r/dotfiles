export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export LESS="-RFXS"
export LESSOPEN="| bat -pp --color=always %s"