oh-my-posh init --config "$env:USERPROFILE/theme.omp.json" pwsh | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

function Get-PersistentHistory {
    Get-Content (Get-PSReadlineOption).HistorySavePath
}

function Start-Compose {
    Invoke-Expression "docker compose $($args -join ' ')"
}

function Write-ProcessDetails{
    $args = $args[0] ?? '*'
    clear; while (1) {ps "$args" | Format-Table; sleep 1;clear}
}

Set-Alias -Name history -Value Get-PersistentHistory -Option AllScope
Set-Alias -Name top -Value Write-ProcessDetails
Set-Alias -Name grep -Value Select-String
Set-Alias -Name dc -Value Start-Compose
