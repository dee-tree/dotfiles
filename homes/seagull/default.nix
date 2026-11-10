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
    
    # ../../profiles/workstation.nix # but without zed. Zed settings are managed at the host
    ../../modules/terminal/ghostty
    ../../modules/editor/obsidian
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";

    packages = with pkgs; [
    ];
  };
  
  xdg.configFile."niri/config.kdl".text = builtins.readFile ./niri-outputs.kdl;
}
