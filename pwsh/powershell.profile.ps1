oh-my-posh init pwsh --config "~\.ohmyposh\themes\onedarkpro.omp.json" | Invoke-Expression
#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1

$colorPalette = @{
    Black = "#282C34";
    Red = "#E06C75";
    Green = "#98C379";
    Yellow = "#E5C07B"
    Blue = "#61AFEF";
    Purple = "#C678DD";
    Cyan = "#56B6C2";
    Gray = "#ABB2BF";
    DarkGray = "#718FAC";
}

Set-PSReadLineOption -Colors @{
    Command = $colorPalette.Green
    Parameter = $colorPalette.Purple
    Operator = $colorPalette.Blue
    Variable = $colorPalette.Red
    String = $colorPalette.Yellow
    Number = $colorPalette.Blue
    Type = $colorPalette.Cyan
    Comment = $colorPalette.Gray
    ContinuationPrompt = $colorPalette.Gray
    InlinePrediction = $colorPalette.DarkGray
}