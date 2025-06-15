{ pkgs, user, ... }: {
	programs.zsh.enable = true;

	users = {
		defaultUserShell = pkgs.zsh;
		users.${user} = {
			isNormalUser = true;
			extraGroups = [ "seat" "input" "video" "wheel" "networkmanager" "docker" ];
		};
	};

	services.getty.autologinUser = user;
}
