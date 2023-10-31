#!/usr/bin/env bash
sudo pacman -Sy chromium foot aria2 curl git neovim wl-clipboard\
	gnupg polkit polkit-gnome waybar dunst dex tmux hyprland zsh
mkdir -p ~/Downloads
cd ~/Downloads
if [ -z `command -v paru` ]; then
	git clone https://aur.archlinux.org/paru && cd paru
	makepkg -sirc --noconfirm
	cd .. && rm -rf paru
else
	echo "paru is already installed"
fi
alias yay="paru --skipreview"
yay -Sy swww google-chrome

# Rust
if [ -z `command -v cargo` ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source ~/.cargo/env
else
	echo "Rust is already installed"
fi

# Golang
if [ -z `command -v go` ]; then
	GV=`git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' \
		https://github.com/golang/go | grep -E '.*tags/go[0-9.]+$' | \
		tail -n1 | awk '{print $2}' | cut -d'/' -f3`
	curl -LO "https://go.dev/dl/${GV}.linux-amd64.tar.gz"
	[ -d /usr/local/go ] && sudo rm -rf /usr/local/go
	sudo tar -C /usr/local -xzf "${GV}.linux-amd64.tar.gz"
	rm "${GV}.linux-amd64.tar.gz"
	export GOPATH="$HOME/code/go"
	export PATH="/usr/local/go/bin:$PATH"
else
	echo "Golang is already installed"
fi

# NodeJS
if [ -z `command -v volta` ]; then
	curl https://get.volta.sh | bash -s -- --skip-setup
	export VOLTA_HOME="$HOME/.volta"
	export PATH="$VOLTA_HOME/bin:$PATH"
	NV=`git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' \
		https://github.com/nodejs/node | grep -E '.*tags/v[0-9.]+$' | \
		tail -n1 | awk '{print $2}' | cut -d'/' -f3 | cut -d'v' -f2`
	volta install node@$NV
	volta install pnpm
else
	echo "Volta is already installed"
fi


# Requirements for Neovim and LSP
echo "Setting up Neovim and LSP requirements"
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest
pnpm install -g svelte-language-server typescript typescript-language-server prettier

# Lua
echo "Setting up the LUA Language Server"
LV=`git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' \
	https://github.com/LuaLS/lua-language-server | grep -E '.*tags/[0-9.]+$' | \
	tail -n1 | awk '{print $2}' | cut -d'/' -f3`
curl -LO "https://github.com/LuaLS/lua-language-server/releases/download/${LV}/lua-language-server-${LV}-linux-x64.tar.gz"
[ -d lualsp ] && rm -rf lualsp
mkdir lualsp && cd lualsp
tar -xzf "../lua-language-server-${LV}-linux-x64.tar.gz"
cd ..
[ -d "~/.local/lualsp" ] && rm -rf "~/.local/lualsp"
mkdir -p ~/.local && mv lualsp ~/.local/lualsp
export PATH="~/.local/lualsp/bin:$PATH"
rm -rf "lua-language-server-${LV}-linux-x64.tar.gz"

# misc tools
echo "Setting up protocol buffers"
PV=`git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' \
	https://github.com/protocolbuffers/protobuf | grep -E '.*tags/v[0-9.]+$' | \
	tail -n1 | awk '{print $2}' | cut -d'/' -f3 | cut -d'v' -f2`
curl -LO "https://github.com/protocolbuffers/protobuf/releases/download/v${PV}/protoc-${PV}-linux-x86_64.zip"
[ -d protoc ] && rm -rf protoc
mkdir protoc && cd protoc
unzip "../protoc-${PV}-linux-x86_64.zip"
cd ..
[ -d "~/.local/protoc" ] && rm -rf "~/.local/protoc"
mv protoc ~/.local/protoc
rm "protoc-${PV}-linux-x86_64.zip"
export PATH="~/.local/protoc/bin:$PATH"
