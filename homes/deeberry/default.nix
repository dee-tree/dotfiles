{
  config,
  pkgs,
  cfg,
  ...
}:
let
  username = "deetree";
in
{
  imports = [
    ../../profiles/core.nix
    ../../profiles/dev.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "bws"
    ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";

    packages = with pkgs; [
      bws
    ];
  };

}
