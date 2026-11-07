{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tree-sitter # grammars, mostly for nvim

    # utils
    ripgrep
    bat
    delta
    secretspec
  ];

}
