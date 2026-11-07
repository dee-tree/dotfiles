{
  config,
  lib,
  pkgs,
  ...
}:

{

  # Note:
  # - Install dms on the host directly to avoid graphics-related issues.
  # - Create dms files writable:
  # mkdir -p ~/.config/niri/dms
  # touch ~/.config/niri/dms/{colors,layout,alttab,binds}.kdl

  xdg.configFile = {
    "danksearch/config.toml".source = config.lib.file.mkOutOfStoreSymlink ./danksearch/config.toml;
  };
}
