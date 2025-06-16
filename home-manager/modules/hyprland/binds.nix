{ pkgs, ... } :

{
	wayland.windowManager.hyprland.settings = {
		bind = [
			"$mainMod      , T, exec      , kitty"
			"$mainMod SHIFT, Q, killactive, "
			"$mainMod CTRL , F, fullscreen, 0"
			
			# moving focus
			"$mainMod, left , movefocus, l"
			"$mainMod, right, movefocus, r"
			"$mainMod, up   , movefocus, u"
			"$mainMod, down , movefocus, d"

			# moving windows
			"$mainMod SHIFT, left , swapwindow, l"
			"$mainMod SHIFT, right, swapwindow, r"
			"$mainMod SHIFT, up   , swapwindow, u"
			"$mainMod SHIFT, down , swapwindow, d"

			# resizeing windows
			"$mainMod CTRL, left , resizeactive, -60 0"
			"$mainMod CTRL, right, resizeactive,  60 0"
			"$mainMod CTRL, up   , resizeactive,  0 -60"
			"$mainMod CTRL, down , resizeactive,  0  60"

		];
	};
}
