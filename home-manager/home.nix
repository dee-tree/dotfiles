{ config, pkgs, cfg, ... }:
let
    username = "dee";
in
{
  imports = [
    ./common.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "obsidian"
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";

    packages = with pkgs; [
        obsidian
        # typst
    ];

    file = {
      # ghostty
      ".config/ghostty/config" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../ghostty/config;
      };
      ".config/ghostty/mappings.conf" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../ghostty/mappings.conf;
      };
      ".config/ghostty/themes" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../ghostty/themes;
          recursive = true;
      };

      # niri
      ".config/niri/niri-binds.kdl" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../niri/niri-binds.kdl;
      };
      ".config/niri/niri-theme.kdl" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../niri/niri-theme.kdl;
      };

      # danksearch
      ".config/danksearch/config.toml" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../niri/danksearch/config.toml;
      };
    };
  };
}
