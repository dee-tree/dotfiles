{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neovim
  ];

  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lua".source = ./lua;
}
