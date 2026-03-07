# GNU utils path overrides as default CLI tools
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do export PATH=$d:$PATH; done
  export PATH="${HOMEBREW_PREFIX}/opt/gnu-getopt/bin:$PATH"
  export PATH="${HOMEBREW_PREFIX}/opt/ncurses/bin:$PATH"
  export PATH="${HOMEBREW_PREFIX}/opt/curl/bin:$PATH"
  export PATH="${HOMEBREW_PREFIX}/opt/rsync/bin:$PATH"
fi

export HOMEBREW_BUNDLE_DUMP_DESCRIBE=1
export HOMEBREW_BUNDLE_FILE=$HOME/.config/brew/Brewfile
export HOMEBREW_FORCE_BREWED_CA_CERTIFICATES=1
export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_FORCE_BREWED_GIT=1
export HOMEBREW_FORCE_VENDOR_RUBY=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_AUTOREMOVE=1
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
# export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

if command -v bat >/dev/null 2>&1; then
  export HOMEBREW_BAT=1
fi
