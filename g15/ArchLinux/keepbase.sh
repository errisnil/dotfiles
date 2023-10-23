sudo pacman -D --asdeps $(pacman -Qqe)
sudo pacman -D --asexplicit amd-ucode asusctl auto-cpufreq-git base \
	base-devel bashmount brightnessctl dunst efibootmgr foot git \
	grub htop libvs-mesa-driver linux linux-firmware mesa-utils \
	mesa-vdpau neovim networkmanager noto-fonts-cjk ntfs-3g os-prober \
	otf-font-awesome otf-latin-modern paru pipewire-alsa pipewire-pulse \
	playerctl polkit powertop reflector rofi supergfxctl swayfx-git \
	swayidle swaylock swww tmux ttf-jetbrains-mono ttf-joypixels \
	ttf-kannada-font ttf-khmer ttf-nerd-fonts-symbols ttf-urdufonts \
	udisks2 unzip waybar wl-clipboard xf86-video-amdgpu xf86-video-vesa \
	zsh

sudo pacman -Qtdq | sudo pacman -Rns -
