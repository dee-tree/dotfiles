{ config, pkgs, cfg, ... }:
let
  username = "deetree";
in
{
  imports = [
    ./common.nix
  ];
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";

    packages = with pkgs; [
      fish
      tree-sitter
    ];
  };

}
