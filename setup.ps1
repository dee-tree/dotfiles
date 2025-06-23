$homedir = $env:userprofile
$localdir = $env:localappdata

$root = split-path -parent $MyInvocation.MyCommand.Definition

# setup logics: not set `skip` variable and not set `setup` for other tool, or set `setup` for this tool
$setup_wezterm = !$env:skip_wezterm -and (!($env:setup_wezterm -or $env:setup_neovim -or $env:setup_ohmyposh -or $env:setup_powershell) -or $env:setup_wezterm)
$setup_neovim = !$env:skip_neovim -and (!($env:setup_wezterm -or $env:setup_neovim -or $env:setup_ohmyposh -or $env:setup_powershell) -or $env:setup_neovim)
$setup_ohmyposh = !$env:skip_ohmyposh -and (!($env:setup_wezterm -or $env:setup_neovim -or $env:setup_ohmyposh -or $env:setup_powershell) -or $env:setup_ohmyposh)
$setup_powershell = !$env:skip_powershell -and (!($env:setup_wezterm -or $env:setup_neovim -or $env:setup_ohmyposh -or $env:setup_powershell) -or $env:setup_powershell)

function isfile($path) {
    # source: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-path?view=powershell-7.5#example-4-check-for-a-file
    Test-Path -Path $path -PathType Leaf
}
function ln($source, $link) {
    if (isfile $source) {
        New-Item -Path $link -ItemType SymbolicLink -Value $source -Force
    } else {
        New-Item -Path $link -ItemType Junction -Value $source -Force
    }
}

# wezterm setup
if ($setup_wezterm) {
    ln "$root/wezterm/wezterm.lua" "$homedir/.wezterm.lua"
    ln "$root/wezterm/.wezterm" "$homedir/.wezterm"
    ln "$root/utilua" "$homedir/.wezterm/dotlocal/utilua"
}

# neovim setup
if ($setup_neovim) {
    $nvimdir = "$localdir/nvim"
    ln "$root/neovim/init.lua" "$nvimdir/init.lua"
    ln "$root/neovim/lua" "$nvimdir/lua"
}

if ($setup_ohmyposh) {
    ln "$root/ohmyposh/themes" "$homedir/.ohmyposh/themes"
}

if ($setup_powershell) {
    $profiledir = Split-Path -Path $profile
    $files = Get-ChildItem "$root/pwsh/"

    Install-PSResource -Name Microsoft.WinGet.CommandNotFound

    foreach ($f in $files){
        $cfgfile = $f.FullName
        $basename = Split-Path $f -leaf
        ln "$cfgfile" "$profiledir/$basename"
    }
    ln "$root/pwsh/powershell.profile.ps1" $profile
}
