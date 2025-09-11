# ---------------------------------
# PATHS
# ---------------------------------
export PATH="$HOME/bin:$PATH"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH
export PREVIEW=true
export NO_IMAGE=true
# ---------------------------------
# OH-MY-ZSH
# ---------------------------------
export ZSH="$HOME/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"
ZSH_THEME=""

# Plugins
plugins=(
  git
  git-commit
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ---------------------------------
# PLUGINS EXTERNOS
# ---------------------------------
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------------------------------
# TOOLS
# ---------------------------------
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
# ---------------------------------
# NVM
# ---------------------------------
export NVM_DIR="$HOME/.nvm"

load_nvm() {
  unset -f node npm npx nvm
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
}

node() { load_nvm; node "$@"; }
npm()  { load_nvm; npm "$@"; }
npx()  { load_nvm; npx "$@"; }
nvm()  { load_nvm; nvm "$@"; }

# ---------------------------------
# ALIASES
# ---------------------------------
alias cat="bat --theme=TwoDark --color=always --style=numbers,header --line-range=:500"
alias fzf='fzf --style=full --preview="bat --color=always --style=numbers,header --line-range=:500 {}"'
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"

