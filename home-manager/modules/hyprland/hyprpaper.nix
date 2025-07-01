{ config, pkgs, lib, ... } : 

{
	services.hyprpaper = {
		enable = true;
		settings = {
			preload = [ "~/nix/assets/wallpapers/dragon.jpg" ];
			wallpaper = lib.mkForce ",~/nix/assets/wallpapers/dragon.jpg";
		};
	};
}
