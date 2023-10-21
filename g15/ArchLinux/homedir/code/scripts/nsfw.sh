if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	pkill swwwbg
	$HOME/.swwwbgn
else
	pkill fehbg
	$HOME/.fehbgn
fi
