{ config, pkgs, ... }:
{
    home.username = "dee";
    home.homeDirectory = "/home/dee";
    home.stateVersion = "25.11";
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        fish
        starship
        neovim
        
        # TODO: ghostty - setup nixGL / nix-system-graphics
        ghostty
        zellij

        ripgrep
    ];

    home.file = {
        # fish
        ".config/fish/config.fish" = {
            source = config.lib.file.mkOutOfStoreSymlink ./../fish/config.fish;
        };
        ".config/fish/conf.d" = {
            source = config.lib.file.mkOutOfStoreSymlink ./../fish/conf.d;
            recursive = true;
        };

        # ghostty
        ".config/ghostty/config" = {
            source = config.lib.file.mkOutOfStoreSymlink ./../ghostty/config;
        };
        ".config/ghostty/mappings.conf" = {
            source = config.lib.file.mkOutOfStoreSymlink ./../ghostty/mappings.conf;
        };
        ".config/ghostty/themes" = {
            source = config.lib.file.mkOutOfStoreSymlink ./../ghostty/themes;
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
    };
}
