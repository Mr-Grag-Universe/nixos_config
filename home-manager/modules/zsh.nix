{pkgs, lib, ...} :
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
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
				{
					name = "romkatv/powerlevel10k"; 
					tags = [ as:theme depth:1 ];
				}
				# For the list of options, please refer to Zplug README.
			];
		};

		oh-my-zsh = {
			enable = true;
			plugins = [ "git" "thefuck" ];
			theme = "robbyrussell"; # "avit";
		};
		
		plugins = [
			{
				name = "powerlevel10k";
				src = pkgs.zsh-powerlevel10k;
				file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
				# src = lib.cleanSource ./p10k-config;
				# file = "grovbox.zsh";
			}
			{
				name = "powerlevel10k-config";
				src = lib.cleanSource ./p10k-config;
				file = "p10k.zsh";
			}
		];

		dotDir = ".config/zsh";
		initContent = ''
			POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
			source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
			test -f ~/.config/zsh/.p10k.zsh && source ~/.config/zsh/.p10k.zsh
			ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#87875F"
			# #E7D7AD"
			# source ~/.p10k.zsh
		'';
	};

}

