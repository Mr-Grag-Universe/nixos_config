{ lib, pkgs, ... }:

let
  peer-port = 51412;
  web-port = 8112;
in {
  
  programs.rtorrent = {
    enable = true;
    port = peer-port;
    package = pkgs.jesec-rtorrent; # currently (2024-12-30) rtorrent 0.15.0 in nixpkgs unstable is incompatible with flood, this is why a fork is used
    openFirewall = true;
  };
}

