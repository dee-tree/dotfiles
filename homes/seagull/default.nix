{
  config,
  pkgs,
  cfg,
  ...
}:
let
  username = "dee";
in
{
  imports = [
    ../../profiles/core.nix
    ../../profiles/dev.nix
    ../../profiles/desktop.nix
    ../../profiles/workstation.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";

    packages = with pkgs; [
    ];
  };
}
