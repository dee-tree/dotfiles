{ config, pkgs, ... }:
let
    username = "deetree";
in
{
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
    programs.direnv.enable = true;

    home.packages = with pkgs; [
        starship
        neovim
        bat
        delta
        
        zellij
        fish

        ripgrep
        tree-sitter
        python3
        nodejs
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

        # vscode
       # ".config/Code/User/settings.json" = {
       #     source = ./../vscode/settings.json;
       # };
       # ".config/Code/User/keybindings.json" = {
       #     source = ./../vscode/keybindings.json;
       # };
       # ".config/Code - OSS/User/settings.json" = {
       #     source = ./../vscode/settings.json;
       # };
       # ".config/Code - OSS/User/keybindings.json" = {
       #     source = ./../vscode/keybindings.json;
       # };
    };
}
