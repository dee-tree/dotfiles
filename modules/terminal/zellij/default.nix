{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.zellij
  ];

  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
