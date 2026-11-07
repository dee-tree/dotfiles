{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neovim
  ];

  xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink ./init.lua;
  xdg.configFile."nvim/lua".source = config.lib.file.mkOutOfStoreSymlink ./lua;
}
