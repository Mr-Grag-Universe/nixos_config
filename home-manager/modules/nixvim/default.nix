{ lib, ... } :
{
    programs.nixvim = {
	enable = true;
	imports = [
		./themes
		./ui
		./utils
	];

	plugins.lualine.enable = true;

	plugins = {
		bufferline.enable = lib.mkDefault true;
	};

	themes.enable = lib.mkDefault true;
	ui.enable = lib.mkDefault true;
	utils.enable = lib.mkDefault true;

	# extraConfigLuaPost = ''vim.cmd [[ colorscheme rose-pine ]]'';
    };
}
