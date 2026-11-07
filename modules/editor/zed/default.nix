{ config, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = null; # manage host installation
    # userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
    # userKeymaps = builtins.fromJSON (builtins.readFile ./keymap.json);
    mutableUserSettings = true;

    #extensions = [
    #  "nix"
    #];
  };

  xdg.configFile."zed/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink ./settings.json;

  xdg.configFile."zed/keymap.json".source = config.lib.file.mkOutOfStoreSymlink ./keymap.json;
}
