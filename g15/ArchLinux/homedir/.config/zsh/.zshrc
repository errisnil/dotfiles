. $HOME/.cargo/env

# volta load
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

[[ -z `command -v fnm` ]] || eval "$(fnm env --use-on-cd)"

autoload -Uz compinit promptinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
promptinit

zstyle ':completion:*' menu select

# fix runtime path
# ln -sf `which node` $HOME/.local/bin/node

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source "$ZDOTDIR/main"

# eval "$(starship init zsh)"
