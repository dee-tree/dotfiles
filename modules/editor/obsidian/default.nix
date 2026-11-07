{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "obsidian"
    ];

  home.packages = [
    pkgs.obsidian
  ];

}
