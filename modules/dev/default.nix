{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    nodejs

    # nix dev
    nixd
    nil
  ];
}
