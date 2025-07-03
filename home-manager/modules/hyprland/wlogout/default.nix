{ config, pkgs, ... }:

let
	script = ./get_params.sh;
	envVars = builtins.readFile script + " 1";  # Передаем индекс стиля, например, 1
in
{
	programs.wlogout = {
		enable = true;
		style = ''
			/*${envVars}*/
			${builtins.readFile ./colors.css}
			${builtins.readFile ./style.css}
		'';
		layout = [
{
  "label"=            "lock";
  "action"=           "hyprlock --immediate";
  "text"=             "Lock";
  "keybind"=          "l";
}
{
  "label"=            "logout";
  "action"=           "hyprctl dispatch exit"; # "loginctl terminate-user $USER";
  "text"=             "Logout";
  "keybind"=          "e";
}
{
  "label"=            "suspend";
  "action"=           "hyprlock --immediate && systemctl suspend-then-hibernate";
  "text"=             "Suspend";
  "keybind"=          "u";
}
{
  "label"=            "hibernate";
  "action"=           "systemctl hibernate";
  "text"=             "Hibernate";
  "keybind"=          "h";
}
{
  "label"=            "shutdown";
  "action"=           "systemctl poweroff";
  "text"=             "Shutdown";
  "keybind"=          "s";
}
{
  "label"=            "reboot";
  "action"=           "systemctl reboot";
  "text"=             "Reboot";
  "keybind"=          "r";
}
		];
	};
}
