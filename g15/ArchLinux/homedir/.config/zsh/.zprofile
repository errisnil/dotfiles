export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# [[ -z "$TMUX" ]] && startx


if [[ -z "$TMUX" ]] && [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec sway
fi
