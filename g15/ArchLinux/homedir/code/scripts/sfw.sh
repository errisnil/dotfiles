if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	pkill swwwbg
	$HOME/.swwwbg
else
	pkill fehbg
	$HOME/.fehbg
fi
