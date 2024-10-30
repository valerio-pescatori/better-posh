oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/catppuccin_macchiato.omp.json' | Invoke-Expression
Invoke-Expression (& { (zoxide init --cmd cd  powershell | Out-String) })
Import-Module Catppuccin
Import-Module git-aliases -DisableNameChecking
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key Tab -Function AcceptSuggestion

function alias-grep {
  param ($SearchString)
  Get-Command -Module git-aliases | Where-Object {$_.Definition -like "*$SearchString*"}
}
