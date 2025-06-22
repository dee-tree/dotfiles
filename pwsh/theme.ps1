# theme:
$setup_ohmyposh = !$env:skip_ohmyposh
if ($setup_ohmyposh) {
    $theme = "theme" # "onedarkpro"
    oh-my-posh init pwsh --config "~\.ohmyposh\themes\$theme.omp.json" | Invoke-Expression
}

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

# workaround to make directories more visible in `ls`
$PSStyle.FileInfo.Directory = "`e[34m"