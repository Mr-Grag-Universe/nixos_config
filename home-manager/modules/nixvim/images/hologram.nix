{ lib, config, ... }:
{
	options = {
		hologram.enable = lib.mkEnableOption "Enable hologram module";
	};
	config = lib.mkIf config.hologram.enable {
		plugins.hologram = {
			enable = true;
			settings = {
				auto_display = true;
			};
		};
	};
}
