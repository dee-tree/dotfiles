#!/bin/bash

set -l homedir (eval echo ~$USER)
set -l root (dirname (realpath (status filename)))

if set -q setup_wezterm && not set -q skip_wezterm
    echo "Setup wezterm"
    ln -s "$root/wezterm/wezterm.lua" "$homedir/.wezterm.lua"
    ln -s "$root/wezterm/.wezterm" "$homedir/.wezterm"
    # mkdir -p "$homedir/.wezterm/dotlocal"
    ln -s "$root/utilua" "$homedir/.wezterm/dotlocal/utilua"
end

if set -q setup_ghostty && not set -q skip_ghostty
    echo "Setup ghostty"
    
    ln -s "$root/ghostty/config" "$homedir/.config/ghostty/config"
    ln -s "$root/ghostty/themes" "$homedir/.config/ghostty/themes"
    ln -s "$root/ghostty/mappings.conf" "$homedir/.config/ghostty/mappings.conf"
    # for file in $root/ghostty/*
        # ln -s $file "$homedir/.config/ghostty/$(basename $file)"
    # end
end

if set -q setup_zsh && not set -q skip_zsh
    echo "Setup zsh"
    # complete manually
    # - zsh:
    #   - sudo apt install zsh
    # - oh-my-zsh:
    #   - sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # - zsh-autocomplete:
    #   - git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
    # - zsh-syntax-highlighting:
    #   - git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    # - zsh-fast-syntax-highlighting:
    #   - git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
    # - zsh-autocomplete
    #   - git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    # - powerlevel10k:
    #   - git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    ln -s "$root/zsh/zshrc" "$homedir/.zshrc"
    ln -s "$root/zsh/.zsh" "$homedir/.zsh"
    ln -s "$root/zsh/p10k.zsh" "$homedir/.p10k.zsh"
end

if set -q setup_fish && not set -q skip_fish
    echo "Setup fish"

    ln -s "$root/fish/config.fish" "$homedir/.config/fish/config.fish"

    for ffile in $root/fish/.fish/*
        ln -s $ffile "$homedir/.config/fish/conf.d/$(basename $ffile)"
    end
end

if set -q setup_neovim && not set -q skip_neovim
    echo "Setup neovim"
    # TODO: use $XDG_CONFIG_HOME
    mkdir -p "$homedir/.config/nvim"
    ln -s "$root/neovim/init.lua" "$homedir/.config/nvim/init.lua"
    ln -s "$root/neovim/lua" "$homedir/.config/nvim/lua"
end

if set -q setup_starship && not set -q skip_starship
    echo "Setup starship"
    ln -s "$root/starship/starship.toml" "$homedir/.config/starship.toml"
end

if set -q setup_zellij && not set -q skip_zellij
    echo "Setup zellij"
    ln -s "$root/zellij/config.kdl" "$homedir/.config/zellij/config.kdl"
end
