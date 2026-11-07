{ config, lib, pkgs, ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      source ${lib.escapeShellArg "${config.xdg.configHome}/fish/custom.fish"}
    '';
  };

  xdg.configFile."fish/custom.fish".source = ./config.fish;

  xdg.configFile."fish/conf.d" = {
    source = config.lib.file.mkOutOfStoreSymlink ./conf.d;
    recursive = true;
  };
}
