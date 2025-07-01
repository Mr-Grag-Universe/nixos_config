{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    neofetch
    fastfetch
    nerdfetch
    microfetch
    telegram-desktop
    obsidian
    vscode
    # rtorrent
    # flood
    kdePackages.okular
    gedit

    # LibreOffice
    libreoffice-qt
    hunspell
    hunspellDicts.ru_RU

    # vpn
    # mullvad-vpn
    # mullvad-closest
    # mullvad-browser
    tor-browser

    # CLI
    bottom
    htop
    btop
    unzip
    wget
    zsh
    zip
    thefuck
    # torctl
    tree
    kitty
    brightnessctl
    playerctl
    pamixer
    grimblast
    jq
    pywal

    # Python
    (python312.withPackages (ppkgs:
      with ppkgs; [
        numpy
        pandas
        seaborn
        scapy
        pip
        requests
        ipykernel
      ]))

    # DevOps
    # vagrant
    openjdk

    # hyprland
    polkit
    hyprland-protocols
    hyprlang
    hyprutils
    hyprwayland-scanner
    libdrm
    # libpipewire
    # libspa
    sdbus-cpp
    # wayland-client
    # wayland-protocol
    gdm
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    libnotify
    dconf
    xwayland
    hyprpaper
    hyprlock
    hypridle

    rofi
    wofi

    # nvim
    # neovim
    # nixvim.homeManagerModules.nixvim
    pyright
    nil
    imagemagick
  ];
}
