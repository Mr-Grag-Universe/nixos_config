{ config, lib, ... }: 
{
	imports = [
		./alpha.nix
		./barbecue.nix
		./bufferline.nix
		./dressing-nvim.nix
		./nui.nix
		./notify.nix
		./web-devicons.nix
	];

	options = {
		ui.enable = lib.mkEnableOption "Enable ui module";
	};
	config = lib.mkIf config.ui.enable {
		# startup screen
		alpha.enable = lib.mkDefault true;
		# elements like structure [x > y > z] in top to click and jump to that start
		barbecue.enable = lib.mkDefault true;
		# some improvements and settings for nvim visual and actions. i don't sure whether it's necessary 
		dressing-nvim.enable = lib.mkDefault true;
		# indent-blankline.enable = lib.mkDefault true;
		# notifications with filtering
		# noice.enable = lib.mkDefault false;
		notify.enable = lib.mkDefault true;
		# ui lib. just dependency
		nui.enable = lib.mkDefault true;
		# just icons
		web-devicons.enable = lib.mkDefault true;
	};
}
