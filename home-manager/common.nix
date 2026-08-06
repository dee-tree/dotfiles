{ config, pkgs, cfg, ... }:
let
  ln = config.lib.file.mkOutOfStoreSymlink;
in {
  home = {
    packages = with pkgs; [
      # user environment
      starship
      neovim
      zellij
      go-task

      # utils
      ripgrep
      bat
      delta

      # dev
      python3
      nodejs
    ];


    file = {
      # fish
      ".config/fish/config.fish" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../fish/config.fish;
      };
      ".config/fish/conf.d" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../fish/conf.d;
          recursive = true;
      };

      # neovim
      ".config/nvim/init.lua" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../neovim/init.lua;
      };
      ".config/nvim/lua" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../neovim/lua;
          recursive = true;
      };

      # starship
      ".config/starship.toml" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../starship/starship.toml;
      };

      # zellij
      ".config/zellij/config.kdl" = {
          source = config.lib.file.mkOutOfStoreSymlink ./../zellij/config.kdl;
      };

      # taskfile
      "taskfile.yml" = {
        source = ln "./../taskfile.yml";
      };
    };
  };

  programs = {
    home-manager.enable = true;
    direnv.enable = true;
  };
}
