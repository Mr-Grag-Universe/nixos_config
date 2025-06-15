{ pkgs, lib, ... } :

{
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        
        package = pkgs.hyprland;
        xwayland.enable = true;
        settings = {
			"$mod" = "SUPER";
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
        };
    };
}
