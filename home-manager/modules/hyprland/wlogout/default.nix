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
  "action"=           "hyprlock";
  "text"=             "Lock";
  "keybind"=          "l";
}
{
  "label"=            "logout";
  "action"=           "loginctl terminate-user ''";
  "text"=             "Logout";
  "keybind"=          "e";
}
{
  "label"=            "suspend";
  "action"=           "swaylock -f && systemctl suspend";
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
