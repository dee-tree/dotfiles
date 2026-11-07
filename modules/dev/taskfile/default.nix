{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    go-task
  ];

  home.file."taskfile.yml" = {
    source = config.lib.file.mkOutOfStoreSymlink ./taskfile.yml;
  };
}
