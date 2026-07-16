<#
.SYNOPSIS
    Starts llama-server with a selected .ini preset from the config directory.

.DESCRIPTION
    Searches for .ini files in $HOME/.config/llama.cpp.
    If one is found, it starts the server immediately.
    If multiple are found, it prompts the user for selection.

.EXAMPLE
    .\Start-LlamaServer.ps1
    Starts the server with interactive selection if needed.

.EXAMPLE
    Get-Help .\Start-LlamaServer.ps1
    Displays this help message.
#>

param(
    [Alias("h")]
    [switch]$Help
)

if ($Help) {
    Get-Help $PSCommandPath
    exit 0
}

$ConfigDir = Join-Path $HOME ".config\llama.cpp"
$Port = 11434
$IdleDuration = 300

if (-not (Test-Path $ConfigDir)) {
    Write-Error "Configuration directory not found: $ConfigDir"
    exit 1
}

$Presets = Get-ChildItem -Path $ConfigDir -Filter "*.ini" -File

if (-not $Presets) {
    Write-Error "No .ini files found in $ConfigDir"
    exit 1
}

$PresetPath = ""

if ($Presets.Count -eq 1) {
    $PresetPath = $Presets[0].FullName
}
else {
    Write-Host "Multiple presets found in ${ConfigDir}:" -ForegroundColor Cyan
    for ($i = 0; $i -lt $Presets.Count; $i++) {
        Write-Host ("{0}) {1}" -f ($i + 1), $Presets[$i].Name)
    }

    $Choice = Read-Host "Select a preset (1-$($Presets.Count))"

    if ($Choice -match '^\d+$' -and [int]$Choice -ge 1 -and [int]$Choice -le $Presets.Count) {
        $PresetPath = $Presets[[int]$Choice - 1].FullName
    }
    else {
        Write-Error "Invalid selection."
        exit 1
    }
}

Write-Host "Starting llama-server with: $(Split-Path $PresetPath -Leaf)" -ForegroundColor Green

& llama-server `
    --models-preset "$PresetPath" `
    --host "0.0.0.0" `
    --port "$Port" `
    --metrics `
    --models-max 3 `
    --sleep-idle-seconds "$IdleDuration"
