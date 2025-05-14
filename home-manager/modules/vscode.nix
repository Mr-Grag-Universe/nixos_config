{
	programs.vscode {
		enable = true;
		extensions = with pkgs.vscode-extensions; [
			waderyan.gitblame
			dracula-theme.theme-dracula
		];
	};
}
