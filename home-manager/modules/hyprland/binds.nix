{ pkgs, ... } :

{
	wayland.windowManager.hyprland.settings = {
		bind = [
			# Volume and Media Control
			", XF86AudioRaiseVolume, exec, pamixer -i 5"
			", XF86AudioLowerVolume, exec, pamixer -d 5"
			", XF86AudioMicMute    , exec, pamixer --default-source -m"
			", XF86AudioMute       , exec, pamixer -t"
			", XF86AudioPlay       , exec, playerctl play-pause"
			", XF86AudioPause      , exec, playerctl play-pause"
			", XF86AudioNext       , exec, playerctl next"
			", XF86AudioPrev       , exec, playerctl previous"

			# Screen brightness
			", XF86MonBrightnessUp  , exec, brightnessctl s +5%"
			", XF86MonBrightnessDown, exec, brightnessctl s 5%-"

			# Screenshots
			", Print, exec, grimblast --notify copysave screen"

			"SUPER,Tab,cyclenext,"
			"SUPER,Tab,bringactivetotop,"

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

			# workspaces
			"$mainMod, 1, workspace, 1"
			"$mainMod, 2, workspace, 2"
			"$mainMod, 3, workspace, 3"
			"$mainMod, 4, workspace, 4"
			"$mainMod, 5, workspace, 5"
			"$mainMod, 6, workspace, 6"
			"$mainMod, 7, workspace, 7"
			"$mainMod, 8, workspace, 8"
			"$mainMod, 9, workspace, 9"
			"$mainMod, 0, workspace, 10"

			# Move active window to a workspace with mainMod + SHIFT + [0-9]
			"$mainMod SHIFT, 1, movetoworkspace, 1"
			"$mainMod SHIFT, 2, movetoworkspace, 2"
			"$mainMod SHIFT, 3, movetoworkspace, 3"
			"$mainMod SHIFT, 4, movetoworkspace, 4"
			"$mainMod SHIFT, 5, movetoworkspace, 5"
			"$mainMod SHIFT, 6, movetoworkspace, 6"
			"$mainMod SHIFT, 7, movetoworkspace, 7"
			"$mainMod SHIFT, 8, movetoworkspace, 8"
			"$mainMod SHIFT, 9, movetoworkspace, 9"
			"$mainMod SHIFT, 0, movetoworkspace, 10"

			# Scroll through existing workspaces with mainMod + scroll
			"$mainMod, mouse_down, workspace, e+1"
			"$mainMod, mouse_up  , workspace, e-1"

			# Move/resize windows with mainMod + LMB/RMB and dragging
			"$mainMod, mouse:272, movewindow"
			# "$mainMod, mouse:273, resizewindow"
			# "ALT, mouse:272, resizewindow"
		];
	};
}
