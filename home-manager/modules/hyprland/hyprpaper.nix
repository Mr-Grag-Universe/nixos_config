{ config, pkgs, lib, ... } : 

{
	services.hyprpaper = {
		enable = true;
		settings = {
			preload = [ "~/nix/wallpapers/dragon.jpg" ];
			wallpaper = lib.mkForce ",~/nix/wallpapers/dragon.jpg";
		};
	};
}
