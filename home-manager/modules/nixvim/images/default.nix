{
  lib,
  config,
  ...
}:
{
	imports = [
		./image.nix
		# ./hologram.nix
	];

	options = {
		images.enable = lib.mkEnableOption "Enable images module";
	};
	config = lib.mkIf config.images.enable {
		image.enable = lib.mkDefault true;
		# hologram.enable = lib.mkDefault true;
	};
}
