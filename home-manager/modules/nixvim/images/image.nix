{ pkgs, lib, config, ... }:
{
	options = {
		image.enable = lib.mkEnableOption "Enable image module";
	};
	config = lib.mkIf config.image.enable {
		plugins.image = {
			enable = true;
			settings = {
backend = "kitty";
integrations = {
	markdown = {
		enabled = true;
		clear_in_insert_mode = false;
		download_remote_images = true;
		only_render_image_at_cursor = false;
		filetypes = [ "markdown" "vimwiki" ]; 
		# markdown extensions (ie. quarto) can go here
        };
        neorg = {
		enabled = true;
		clear_in_insert_mode = false;
		download_remote_images = true;
		only_render_image_at_cursor = false;
		filetypes = [ "norg" ];
        };
        html = {
            enabled = false;
        };
        css = {
            enabled = false;
        };
};
			};
		};

		extraLuaPackages = ps: [ ps.magick ];
		extraPackages = [ pkgs.imagemagick ];
	};
}
