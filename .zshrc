# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="strug"
zstyle ':omz:update' mode auto
HIST_STAMPS="yyyy-mm-dd"
plugins=(1password alias-finder colored-man-pages common-aliases git magic-enter nodenv)
source $ZSH/oh-my-zsh.sh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# User configuration
export LANG=en_US.UTF-8
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

# --- Managed by codeartifact-authenticator (do not edit) ---
# Source CodeArtifact PIP_INDEX_URL for every shell
if [ -f "$HOME/.config/discogs/codeartifact-pip-env" ]; then
    source "$HOME/.config/discogs/codeartifact-pip-env"
fi
# Warn if CodeArtifact tokens are stale (>12h) — deferred to first prompt
_ca_check_stale() {
    if [ -f "$HOME/.config/discogs/codeartifact-refreshed-at" ]; then
        local _ca_age=$(( $(date +%s) - $(cat "$HOME/.config/discogs/codeartifact-refreshed-at") ))
        if [ "$_ca_age" -ge 43200 ]; then
            printf '\033[33mCodeArtifact token expired — run: codeartifact-authenticator\033[0m\n'
        fi
    fi
    add-zsh-hook -d precmd _ca_check_stale
    unset -f _ca_check_stale
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _ca_check_stale
# --- End codeartifact-authenticator ---
