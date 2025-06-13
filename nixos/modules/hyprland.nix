{ pkgs, lib, inputs, ... } : 

{
  programs.hyprland = {
    enable = false;
    withUWSM = true;
    # xwayland.enable = false;

    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  # security.pam.services.hyprlock = {};
}