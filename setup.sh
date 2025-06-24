#!/bin/bash

homedir=$(eval echo ~$USER)
root=$(dirname $(realpath "$0"))

setup_wezterm_init=$setup_wezterm
setup_zsh_init=$setup_zsh

[[ !($skip_wezterm) && !($setup_wezterm_init || $setup_neovim_init || $setup_ohmyposh_init || $setup_zsh_init) || $setup_wezterm_init ]] && setup_wezterm=true || setup_wezterm=false
[[ !($skip_zsh) && !($setup_wezterm_init || $setup_neovim_init || $setup_ohmyposh_init || $setup_zsh_init) || $setup_zsh_init ]] && setup_zsh=true || setup_zsh=false

echo "wezterm.lua: $root/wezterm/wezterm.lua"
echo "homedir: $homedir"
if [[ $setup_wezterm == true ]]; then
    echo "Setup wezterm"
    ln -s "$root/wezterm/wezterm.lua" "$homedir/.wezterm.lua"
    ln -s "$root/wezterm/.wezterm" "$homedir/.wezterm"
    # mkdir -p "$homedir/.wezterm/dotlocal"
    ln -s "$root/utilua" "$homedir/.wezterm/dotlocal/utilua"
fi

if [ $setup_zsh ]; then
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
fi