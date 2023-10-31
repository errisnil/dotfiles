# [[ -z "$TMUX" ]] && startx

export MOZ_ENABLE_WAYLAND=1
if [[ -z "$TMUX" ]] && [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	sway
fi
