{ config, pkgs, ... }:

{
  # home.packages = [
  #   pkgs.ghostty
  # ];
  #

  xdg.configFile."ghostty/config".source = ./config;
  xdg.configFile."ghostty/mappings.conf".source = ./mappings.conf;
  xdg.configFile."ghostty/themes".source = ./themes;
}
