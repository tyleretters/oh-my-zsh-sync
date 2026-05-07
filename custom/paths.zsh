# tse 260507
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export CDPATH=".:$HOME/projects"
# export PATH="$HOME/.nodenv/bin:$PATH"  # disabled — using nvm instead
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(nodenv init -)"  # disabled — using nvm instead
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/Applications/PACEAntiPiracy/Eden/Fusion/Versions/5/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Auto-switch node version when entering a directory with .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
