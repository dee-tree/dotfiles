{
  imports = [
    ../modules/shell/fish
    ../modules/terminal/zellij
    ../modules/terminal/starship
    ../modules/terminal/cli.nix
  ];

  programs = {
    home-manager.enable = true;
    direnv.enable = true;
  };
}
