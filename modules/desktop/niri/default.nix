{ config, lib, pkgs, ... }:

{
  # Note:
  # Install niri on the host directly to avoid graphics-related issues.
  # Manage only config files via home-manager.

  xdg.configFile = {
    "niri/config.kdl".text = lib.mkBefore (builtins.readFile ./config.kdl);
    "niri/appearance.kdl".source = ./appearance.kdl;
    "niri/input.kdl".source = ./input.kdl;
    "niri/keybindings.kdl".source = ./keybindings.kdl;
  };
}
