{
  lib,
  config,
  ...
}:
{
  imports = [
    ./better-escape.nix # для vim сочетаний выхода из режима x в режим normal
    ./cloak.nix # для запикивания .env переменных
    ./colorizer.nix # для визуализации hex-цветов
    # ./harpoon.nix
    ./markdown-preview.nix # open .md files in firefox (or in another browser)
    ./mini.nix # dependency
    # ./neocord.nix
    # ./neotest.nix
    ./nvim-autopairs.nix
    ./nvim-surround.nix
    ./nvterm.nix # Neve terminal
    # ./oil.nix
    ./persistence.nix # for session restorage
    ./plenary.nix # dependency
    ./project-nvim.nix # for last folders memory
    # ./sidebar.nix
    # ./tmux-navigator.nix
    ./todo-comments.nix # for cool colorized todo and other comments messages
    # ./ultimate-autopair.nix
    ./undotree.nix # for git-like undo tree
    ./vim-floaterm.nix # for terminal
    ./wakatime.nix # for programming statistics (useless, but shiny)
    # ./which-key.nix
    ./wilder.nix # for vim :xxx command nicer interface
  ];

  options = {
    utils.enable = lib.mkEnableOption "Enable utils module";
  };
  config = lib.mkIf config.utils.enable {
    better-escape.enable = lib.mkDefault false;
    cloak.enable = lib.mkDefault false;
    # harpoon.enable = lib.mkDefault true;
    markdown-preview.enable = lib.mkDefault false;
    mini.enable = lib.mkDefault true;
    # neocord.enable = lib.mkDefault true;
    # neotest.enable = lib.mkDefault true;
    nvim-autopairs.enable = lib.mkDefault true;
    colorizer.enable = lib.mkDefault true;
    nvim-surround.enable = lib.mkDefault true;
    # nvterm.enable = lib.mkDefault true;
    # oil.enable = lib.mkDefault true;
    persistence.enable = lib.mkDefault true;
    plenary.enable = lib.mkDefault true;
    project-nvim.enable = lib.mkDefault true;
    # sidebar.enable = lib.mkDefault false;
    # tmux-navigator.enable = lib.mkDefault true;
    todo-comments.enable = lib.mkDefault true;
    # ultimate-autopair.enable = lib.mkDefault true;
    undotree.enable = lib.mkDefault false;
    vim-floaterm.enable = lib.mkDefault true;
    wakatime.enable = lib.mkDefault false;
    # which-key.enable = lib.mkDefault true;
    wilder.enable = lib.mkDefault true;
  };
}
