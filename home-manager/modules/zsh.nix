{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			ll = "ls -l";
			update = "sudo nixos-rebuild switch";
		};
		history.size = 10000;

		zplug = {
			enable = true;
			plugins = [
				{ name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
				{ name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # For the list of options, please refer to Zplug README.
			];
		};

		oh-my-zsh = {
			enable = true;
			plugins = [ "git" "thefuck" ];
			theme = "robbyrussell";
		};
	};

	
}

