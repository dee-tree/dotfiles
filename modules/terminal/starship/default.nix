{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.starship
  ];

  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink ./starship.toml;
}
