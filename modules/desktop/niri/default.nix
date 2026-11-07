{ config, lib, pkgs, ... }:

{
  # Note:
  # Install niri on the host directly to avoid graphics-related issues.
  # Manage only config files via home-manager.

  xdg.configFile = {
    "niri/config.kdl".text = lib.mkBefore (builtins.readFile ./config.kdl);
    "niri/appearance.kdl".source = config.lib.file.mkOutOfStoreSymlink ./appearance.kdl;
    "niri/input.kdl".source = config.lib.file.mkOutOfStoreSymlink ./input.kdl;
    "niri/keybindings.kdl".source = config.lib.file.mkOutOfStoreSymlink ./keybindings.kdl;
  };
}
