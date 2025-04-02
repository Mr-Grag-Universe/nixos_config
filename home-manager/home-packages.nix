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

		# Python
		(python312.withPackages (ppkgs: [
			ppkgs.numpy
			ppkgs.pandas
			ppkgs.scapy
			ppkgs.pip
			# ppkgs.cyclonedx-bom
		]))# .override (args: {
		# 	postInstall = ''
		# 	$out/bin/pip install cyclonedx-bom
		# 	'';
		# })

		# DevOps
		# vagrant
		openjdk
	];
}
