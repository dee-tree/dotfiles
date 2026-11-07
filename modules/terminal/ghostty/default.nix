{ config, pkgs, ... }:

{
  # home.packages = [
  #   pkgs.ghostty
  # ];
  #

  xdg.configFile."ghostty/config".source = config.lib.file.mkOutOfStoreSymlink ./config;
  xdg.configFile."ghostty/mappings.conf".source = config.lib.file.mkOutOfStoreSymlink ./mappings.conf;
  xdg.configFile."ghostty/themes".source = config.lib.file.mkOutOfStoreSymlink ./themes;
}
