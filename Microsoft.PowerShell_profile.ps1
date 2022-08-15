Import-Module posh-git

oh-my-posh init --config "$PSScriptRoot/theme.omp.json" pwsh | Invoke-Expression

$env:POSH_GIT_ENABLED = $true

function Get-PersistentHistory {
    Get-Content (Get-PSReadlineOption).HistorySavePath
}

function Start-Compose {
    Invoke-Expression "docker compose $($args -join ' ')"
}

Set-Alias -Name history -Value Get-PersistentHistory -Option AllScope
Set-Alias -Name grep -Value Select-String
Set-Alias -Name dc -Value Start-Compose
