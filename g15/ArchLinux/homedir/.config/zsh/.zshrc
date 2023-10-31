autoload -Uz compinit promptinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
promptinit

zstyle ':completion:*' menu select

# fix runtime path
# ln -sf `which node` $HOME/.local/bin/node

# Completions
fpath+=${ZDOTDIR:-~}/.zsh_functions

source "$ZDOTDIR/main"
