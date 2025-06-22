{
  lib,
  config,
  ...
}:
{
  imports = [
    ./base16.nix
    ./catppuccin.nix
    ./rose-pine.nix
  ];

  options = {
    themes.enable = lib.mkEnableOption "Enable colorschemes module";
  };
  config = lib.mkIf config.themes.enable {
    base16.enable = lib.mkDefault false;
    catppuccin.enable = lib.mkDefault false;
    rose-pine.enable = lib.mkDefault true;
  };
}
