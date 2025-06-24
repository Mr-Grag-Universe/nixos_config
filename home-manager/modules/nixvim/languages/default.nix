{
  lib,
  config,
  ...
}:
{
  imports = [
    ./cmp.nix
    ./lsp-nvim.nix
    ./lspsaga.nix
    ./treesitter-nvim.nix
    ./trouble.nix
    # ./nvim-jdtls.nix
    # ./nvim-lint.nix
  ];

  options = {
    languages.enable = lib.mkEnableOption "Enable languages module";
  };
  config = lib.mkIf config.languages.enable {
    cmp.enable = lib.mkDefault true;
    lspsaga.enable = lib.mkDefault true;
    lsp-nvim.enable = lib.mkDefault true;
    treesitter-nvim.enable = lib.mkDefault true;
    trouble.enable = lib.mkDefault true;
    # nvim-jdtls.enable = lib.mkDefault true;
    # nvim-lint.enable = lib.mkDefault true;
  };
}
