
Push-Location (Split-Path -parent $profile)
"theme","components","functions","aliases","exports","extra",".local" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}
Pop-Location
