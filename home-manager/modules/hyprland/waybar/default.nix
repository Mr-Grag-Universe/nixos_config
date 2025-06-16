{
	programs.waybar = {
		enable = true;
		systemd = {
			enable = true;
			target = "hyprland-session.target";
		};

		style = ./style.css;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				height = 30;
				spacing = 4;

				# modules : [left -- center -- right]
				modules-left = [
					"hyprland/workspaces"
					"hyprland/mode"
					# "sway/scratchpad"
					# "sway/media"
					# "clock"
				];
				modules-center = [
					"hyprland/window"
					# "clock"
				];
				modules-right = [
					"hyprland/language"
					# "pulseaudio"
					"battery"
					"clock"
				];

				"battery" = {
        				"format" = "{capacity}% {icon}";
					"format-icons" = ["" "" "" "" ""];
				};
				"clock" = {
					interval = 1;
					format = "{:%I:%M %p  %A %b %d}";
					tooltip = true;
					tooltip-format= "{=%A; %d %B %Y}\n<tt>{calendar}</tt>";
        			};
			};
		};
	};

}
