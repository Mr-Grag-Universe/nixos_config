{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
	# disable_loading_bar = true;
	# grace = 10;
        hide_cursor = true;
	# no_fade_in = false;
      };

      label = [
# Hours
{
    monitor = "";
    text = ''
    	cmd[update:1000] echo "<b><big> $(date +'%H') </big></b>"
    '';
    color = "";
    font_size = 82; # 112;
    font_family = "Geist Mono 10";
    shadow_passes = 3;
    shadow_size = 4;

    position = "0, 300"; # "0, 220";
    halign = "center";
    valign = "center";
}

# Minutes
{
    monitor = "";
    text = ''
    	cmd[update:1000] echo "<b><big> $(date +'%M') </big></b>"
    '';
    color = "";
    font_size = 82; # 112;
    font_family = "Geist Mono 10";
    shadow_passes = 3;
    shadow_size = 4;

    position = "0, 160"; # "0, 80";
    halign = "center";
    valign = "center";
}

# Today
{
    monitor = "";
    text = ''
	cmd[update:18000000] echo "<b><big> $(date +'%A') </big></b>"
    '';
    color = "";
    font_size = 22;
    font_family = "JetBrainsMono Nerd Font 10";

    position = "0, 50"; # "0, 30";
    halign = "center";
    valign = "center";
}

# Week
{
    monitor = "";
    text = ''
	cmd[update:18000000] echo "<b> $(date +'%d %b') </b>"
    '';
    color = "";
    font_size = 18;
    font_family = "JetBrainsMono Nerd Font 10";

    position = "0, 6";
    halign = "center";
    valign = "center";
}

# Degrees
{
    monitor = "";
    text = ''
	cmd[update:18000000] echo "<b>Feels like<big> $(curl -s 'wttr.in?format=%t' | tr -d '+') </big></b>"
    '';
    color = "";
    font_size = 18;
    font_family = "Geist Mono 10";

    position = "0, 40";
    halign = "center";
    valign = "bottom";
}
      ];

      background = [{
	monitor = "";
	path = "$HOME/nix/assets/hyprlock/screen/flowers_1.jpg";
	# only png supported for now
	
	# color = $color1
	blur_size = 4;
	blur_passes = 3; # 0 disables blurring
	noise = 0.0117;
	contrast = 1.3000; # Vibrant!!!
	brightness = 0.8000;
	vibrancy = 0.2100;
	vibrancy_darkness = 0.0;
      }];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          font_color = "rgb(235, 219, 178)";
          inner_color = "rgb(40, 40, 40)";
          outer_color = "rgb(60, 56, 54)";
          outline_thickness = 5;
          placeholder_text = "Enter password here!";
          shadow_passes = 1;
        }
      ];
    };
  };
}
