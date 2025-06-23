root=$(dirname "$0")

setup_wezterm=$skip_wezterm && (!($setup_wezterm || $setup_neovim || $setup_ohmyposh || $setup_powershell) || $setup_wezterm)
setup_zsh=$skip_zsh && (!($setup_wezterm || $setup_neovim || $setup_ohmyposh || $setup_powershell) || $setup_zsh)

if [ $setup_wezterm ]; then
    ln -s "$root/wezterm/wezterm.lua" "~/.wezterm.lua"
    ln -s "$root/wezterm/.wezterm" "~/.wezterm"
    ln -s "$root/utilua" "~/.wezterm/dotlocal/utilua"
fi

if [ $setup_zsh ]; then
    ln -s "$root/zsh/zshrc" "~/.zshrc"
    ln -s "$root/zsh/.zsh" "~/.zsh"
fi