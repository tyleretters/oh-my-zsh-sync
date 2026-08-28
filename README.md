# oh-my-zsh-sync

```zsh
Usage: ./sync.sh <direction>
  where <direction> is one of:
    down : repo -> live (custom -> ~/.oh-my-zsh/custom, .zshrc -> ~/.zshrc, gitconfig-colors -> ~/.gitconfig-colors)
    up   : live -> repo (custom -> ~/projects/oh-my-zsh-sync/custom, .zshrc -> ~/projects/oh-my-zsh-sync/.zshrc, gitconfig-colors)
    help : Display this help message
```

## dependencies

- [nodenv](https://github.com/nodenv/nodenv) `brew install nodenv`
