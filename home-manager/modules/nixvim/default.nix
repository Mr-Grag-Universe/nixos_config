{ lib, ... } :
{
    programs.nixvim = {
	enable = true;

	globals.mapleader = " ";
	
	imports = [
		./filetrees
		./git
		./images
		./languages
		./telescope
		./themes
		./ui
		./utils
		./binds.nix
	];

	plugins.lualine.enable = true;

	plugins = {
		bufferline.enable = lib.mkDefault true;
	};

	filetrees.enable = lib.mkDefault true;
	git.enable = lib.mkDefault true;
	images.enable = lib.mkDefault true;
	languages.enable = lib.mkDefault true;
	themes.enable = lib.mkDefault true;
	telescope.enable = lib.mkDefault true;
	ui.enable = lib.mkDefault true;
	utils.enable = lib.mkDefault true;

	# extraConfigLuaPost = ''vim.cmd [[ colorscheme rose-pine ]]'';
    };
}
