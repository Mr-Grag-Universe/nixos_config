{ pkgs, lib, inputs, ... } : 

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
    # depricated -> nvidiaPatches = false;

    # error -> package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  # security.pam.services.hyprlock = {};

  # services.seatd = {
  #   enable = false;
  #   # logindIntegration = true;
  # };
  # services.udev.extraRules = ''
  #  KERNEL=="event[0-9]*", TAG+="uaccess"
  #   KERNEL=="dri/card[0-9]*", TAG+="uaccess"
  #   KERNEL=="mice", TAG+="uaccess"
  #   KERNEL=="mouse[0-9]*", TAG+="uaccess"
  #   KERNEL=="ts[0-9]*", TAG+="uaccess"
  #   KERNEL=="input[0-9]*", TAG+="uaccess"
  # '';

  # services.dbus.enable = true;
  # programs.dconf.enable = true;
  # security.polkit.enable = true;
  # hardware.graphics.enable = true;
}
