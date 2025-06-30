{ config, lib, pkgs, ... }:

{
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      style = (builtins.readFile ./style.css);
      settings = [{
        "layer" = "top";
        "position" = "top";
	"margin-left" = 20;
	"margin-right" = 20;
	"margin-top" = 10;
	"margin-bottom" = 10;

        modules-left = [
          "custom/launcher"
          "temperature"
	  "hyprland/workspaces"
          # "mpd"
          # "custom/cava-internal"
        ];
        modules-center = [
        	"clock#time"
		"custom/separator" 
		"clock#week" 
		"custom/separator_dot" 
		"clock#month"
		"custom/separator" 
		"clock#calendar"
        ];
        modules-right = [
          "pulseaudio"
          "backlight"
          "memory"
          "cpu"
          "network"
          "tray"
	  "battery"
	  "battery#bat2"
	  # "custom/powermenu"
	  "custom/logout_menu"
        ];
	"backlight" = {
		format = "{icon} {percent}%";
		format-icons = ["" "" "" "" "" "" "" "" ""];	
	};
        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill wofi || wofi --show drun";
          "on-click-middle" = "exec default_wall";
          "on-click-right" = "exec wallpaper_random";
          "tooltip" = false;
        };
        "custom/cava-internal" = {
          "exec" = "sleep 1s && cava-internal";
          "tooltip" = false;
        };
        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = [ "" "" "" ];
          };
          "on-click" = "pamixer -t";
          "tooltip" = false;
        };
			# "clock" = {
			# "interval" = 1;
			# "format" = "{:%I:%M %p  %A %b %d}";
			# "tooltip" = true;
			# # "tooltip-format"= "{=%A; %d %B %Y}\n<tt>{calendar}</tt>";
		# "tooltip-format" = ''
			# <big>{:%Y %B}</big>
			# <tt><small>{calendar}</small></tt>'';
			# };
	

"clock#time" = {
	"format" = "{:%I:%M %p %Ez}";
	#  "locale": "en_US.UTF-8",
	#  "timezones": [ "Europe/Kyiv", "America/New_York" ],
};

"custom/separator" = {
	"format" = "|";
	"tooltip" = false;
};

"custom/separator_dot" = {
	"format" = "•";
	"tooltip" = false;
};

"clock#week" = {
	"format" = "{:%a}";
};

"clock#month" = {
	"format" = "{:%h}";
};

"clock#calendar" = {
	"format" = "{:%F}";
	"tooltip-format" = "<tt><small>{calendar}</small></tt>";
	"actions" = {
		"on-click-right" = "mode";
        };
        "calendar" = {
            "mode"          = "month";
            "mode-mon-col"  = 3;
            "weeks-pos"     = "right";
            "on-scroll"     = 1;
            "on-click-right"= "mode";
            "format" = {
                "months"=     "<span color='#f4dbd6'><b>{}</b></span>";
                "days"=       "<span color='#cad3f5'><b>{}</b></span>";
                "weeks"=      "<span color='#c6a0f6'><b>W{}</b></span>";
                "weekdays"=   "<span color='#a6da95'><b>{}</b></span>";
                "today"=      "<span color='#8bd5ca'><b><u>{}</u></b></span>";
            };
        };
};
"clock" = {
        "format" = "{:%I:%M %p %Ez | %a • %h | %F}";
        "format-alt" = "{:%I:%M %p}";
        "tooltip-format" = "<tt><small>{calendar}</small></tt>";
	#  "locale": "en_US.UTF-8",
	#  "timezones": [ "Europe/Kyiv", "America/New_York" ],
        "actions" = {
            "on-click-right" = "mode";
        };
        "calendar" = {
            "mode"          = "month";
            "mode-mon-col"  = 3;
            "weeks-pos"     = "right";
            "on-scroll"     = 1;
            "on-click-right"= "mode";
            "format" = {
                "months"=     "<span color='#f4dbd6'><b>{}</b></span>";
                "days"=       "<span color='#cad3f5'><b>{}</b></span>";
                "weeks"=      "<span color='#c6a0f6'><b>W{}</b></span>";
                "weekdays"=   "<span color='#a6da95'><b>{}</b></span>";
                "today"=      "<span color='#8bd5ca'><b><u>{}</u></b></span>";
            };
        };
};
        "memory" = {
          "interval" = 2;
          "format" = "󰻠 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 2;
          "format" = "󰍛 {usage}%";
        };
        "mpd" = {
          "max-length" = 25;
          "format" = "<span foreground='#bb9af7'></span> {title}";
          "format-paused" = " {title}";
          "format-stopped" = "<span foreground='#bb9af7'></span>";
          "format-disconnected" = "";
          "on-click" = "mpc --quiet toggle";
          "on-click-right" = "mpc update; mpc ls | mpc add";
          "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
          "on-scroll-up" = "mpc --quiet prev";
          "on-scroll-down" = "mpc --quiet next";
          "smooth-scrolling-threshold" = 5;
          "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
        };
        "network" = {
          "format-disconnected" = "󰯡 Disconnected";
          "format-ethernet" = "󰒢 Connected!";
          "format-linked" = "󰖪 {essid} (No IP)";
          "format-wifi" = "󰖩 {essid}";
          "interval" = 1;
          "tooltip" = false;
        };
        # "custom/powermenu" = {
        #   "format" = "";
        #   "on-click" = "pkill rofi || 
	# ~/.config/rofi/powermenu/type-3/powermenu.sh";
        #   "tooltip" = false;
        # };
	"custom/powermenu" = {
		"format" = "⏻";
				"tooltip" = false;
				"menu" = "on-click";
				"menu-file" = "~/nix/home-manager/modules/hyprland/waybar/power_menu.xml";
				"menu-actions" = {
				"shutdown" = "shutdown -h now";
				"reboot" = "reboot";
				"suspend" = "systemctl suspend";
				"hibernate" = "systemctl hibernate";
				};
	};
	"custom/logout_menu" = {
		"return-type" = "json";
		"exec"= "echo '{ \"text\":\"󰐥\", \"tooltip\": \"logout menu\" }'";
		"interval"= "once";
		"on-click"= "zsh -c wlogout";
	};

	"battery" = {
		"states" = {
			"good" = 95;
			"warning" = 30;
			"critical" = 15;
		};
		"format" = "{capacity}% {icon}";
		"format-full" = "{capacity}% {icon}";
		"format-charging" = "{capacity}% ";
		"format-plugged" = "{capacity}% ";
		"format-alt" = "{time} {icon}";
		"format-icons" = ["" "" "" "" ""];
	};
	"battery#bat2" = {
		"bat" = "BAT2";
	};

	"tray" = {
		"icon-size" = 15;
		"spacing" = 5;
        };
      }];
    };
}
