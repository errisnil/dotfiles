export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# [[ -z "$TMUX" ]] && startx

# export MOZ_ENABLE_WAYLAND=1
# if [[ -z "$TMUX" ]] && [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
# 	exec sway 
# fi
