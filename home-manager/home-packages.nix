{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

	home.packages = with pkgs; [
		# # It is sometimes useful to fine-tune packages, for example, by applying
		# # overrides. You can do that directly here, just don't forget the
		# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
		# # fonts?
		# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

		# # You can also create simple shell scripts directly inside your
		# # configuration. For example, this adds a command 'my-hello' to your
		# # environment:
		# (pkgs.writeShellScriptBin "my-hello" ''
		#   echo "Hello, ${config.home.username}!"
		# '')
		
		neofetch
		telegram-desktop
		obsidian
		vscode
		# rtorrent
		# flood
		okular

		# LibreOffice
		libreoffice-qt
		hunspell
		hunspellDicts.ru_RU

		# CLI
		bottom
		htop
		unzip
		wget
		zsh
		zip
		neovim
		thefuck
		# torctl
		tree

		# Python
		(python312.withPackages (ppkgs: with ppkgs; [
			numpy
			pandas
			seaborn
			scapy
			pip
			requests
			ipykernel
		]))

		# DevOps
		# vagrant
		openjdk
	];
}
