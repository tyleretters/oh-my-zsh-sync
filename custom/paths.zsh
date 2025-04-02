# tse 250331
export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(nodenv init -)"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
