{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		gcc
		kdenlive
		vim
		git
		(wrapHelm kubernetes-helm {
			plugins = with pkgs.kubernetes-helmPlugins; [
				helm-secrets
				helm-diff
				helm-s3
				helm-git
				helm-dashboard
			];
		})
		helm-dashboard 
		kubectl
		# vagrant
		# docker
		# jetbrains.pycharm-professional
		# jre8
		# qemu
		# quickemu
	];
}
