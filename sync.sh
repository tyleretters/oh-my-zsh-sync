#!/bin/zsh

# Script to sync oh-my-zsh custom files and .zshrc in either direction.

# custom
OMZ_CUSTOM="$HOME/.oh-my-zsh/custom"
SYNC_CUSTOM="$HOME/projects/oh-my-zsh-sync/custom"

# .zshrc
ZSHRC_OMZ="$HOME/.zshrc"
ZSHRC_SYNC="$HOME/projects/oh-my-zsh-sync/.zshrc"


sync_dirs() {
  local source="$1"
  local destination="$2"
  echo "Syncing directory from '$source' to '$destination'..."
  mkdir -p "$destination"
  rsync -av --delete --exclude 'themes/' --exclude 'plugins/' "$source/" "$destination/"
  echo "Directory synchronization complete."
}

sync_file() {
  local source="$1"
  local destination="$2"
  echo "Syncing file from '$source' to '$destination'..."
  mkdir -p "$(dirname "$destination")"
  rsync -av --delete "$source" "$destination"
  echo "File synchronization complete."
}

direction="$1"

case "$direction" in
  "down")
    echo "Syncing to oh-my-zsh and related..."
    sync_dirs "$SYNC_CUSTOM" "$OMZ_CUSTOM"
    sync_file "$ZSHRC_SYNC" "$ZSHRC_OMZ"
    ;;
  "up")
    echo "Syncing to projects directory..."
    sync_dirs "$OMZ_CUSTOM" "$SYNC_CUSTOM"
    sync_file "$ZSHRC_OMZ" "$ZSHRC_SYNC"
    ;;
  "help"|"-h"|"--help"|"")
    echo "Usage: $0 <direction>"
    echo "  where <direction> is one of:"
    echo "    down : Sync custom files to ~/.oh-my-zsh/custom and .zshrc to ~/projects/zshrc/.zshrc"
    echo "    up   : Sync custom files to ~/projects/oh-my-zsh-sync/custom and .zshrc to ~/projects/zshrc/.zshrc"
    echo "    help : Display this help message"
    exit 1
    ;;
  *)
    echo "Error: Invalid direction '$direction'."
    echo "Use 'help' for usage instructions."
    exit 1
    ;;
esac

exit 0
