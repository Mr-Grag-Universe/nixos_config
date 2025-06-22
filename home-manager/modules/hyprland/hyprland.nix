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
			exec = [
				"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
				"dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
				# boot waybar
				"pkill waybar & sleep 0.5 && waybar"
			];

			monitor = ",1920x1080@60,auto,1";

			input = {
				kb_layout = "us,ru";
				kb_options= "grp:win_space_toggle";
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

			decoration = {
				rounding = 8;
				# blur = 0;
				# drop_shadow = 0;
				# shadow_range = 60;
				# col.shadow = "0x66000000";
			};
		};
	};
}
