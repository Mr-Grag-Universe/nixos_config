{ pkgs, lib, ... } :

{
	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;

		package = pkgs.hyprland;
		xwayland.enable = true;
		settings = {
			"$mainMod" = "SUPER";
			env = [
				# Hint Electron apps to use Wayland
				"NIXOS_OZONE_WL,1"
				"XDG_CURRENT_DESKTOP,Hyprland"
				"XDG_SESSION_TYPE,wayland"
				"XDG_SESSION_DESKTOP,Hyprland"
				"QT_QPA_PLATFORM,wayland"
				"XDG_SCREENSHOTS_DIR,$HOME/screens"
			];
			monitor = ",1920x1080@60,auto,1";

			input = {
				kb_layout = "us";
				# kb_variant = 
				follow_mouse = 1; # 0-4
				scroll_method = "2fg";

				touchpad = {
					natural_scroll = true;
					disable_while_typing = true;
					clickfinger_behavior = true;
					scroll_factor = 1.2;
				};
			};

			general = {
				# style
				border_size = 1;
				gaps_in = 5;
				gaps_out = 20;
				gaps_workspaces = 50;
				# col.active_border = rgba(0DB7D4FF);
				# col.inactive_border = rgba(31313600);

				# fuctionality
				layout = "dwindle";
				no_focus_fallback = false; # circular coursor moving throught the border
				resize_on_border = true;
				# resize_corner = 
			};

			# gestures = {}
			
			misc = {
				disable_hyprland_logo = true;
				vfr = true;
				vrr = 1;
				animate_manual_resizes = true;
				animate_mouse_windowdragging = false;
				enable_swallow = true;
				new_window_takes_over_fullscreen = 2;
			};
		};
	};
}
