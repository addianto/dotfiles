<#
.SYNOPSIS
    Upgrades WinGet packages declared in a WinGet DSC YAML file.
.DESCRIPTION
    This script parses YAML files containing WinGet package configurations
    and upgrades all packages that have Ensure set to Present.
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$YamlFilePath
)

try {
    # Read the YAML file content
    $content = Get-Content -Path $YamlFilePath -Raw

    # Split the content into individual resource blocks
    $resourceBlocks = $content -split '(?m)(?=^\s*-\s*resource:)' | Select-Object -Skip 1

    # Process each resource block
    Write-Host "Upgrading WinGet packages declared in $YamlFilePath ...`n"

    foreach ($block in $resourceBlocks) {
        # Check if this is a WinGetPackage resource and has Ensure: Present
        if ($block -match 'Microsoft\.WinGet\.DSC/WinGetPackage' -and
            $block -match 'Ensure:\s*Present') {

            # Extract the ID
            if ($block -cmatch 'Id:\s*(.*)') {
                $id = $matches[1].Trim(' "')
                Write-Host "$id"
                winget upgrade --disable-interactivity --id "$id"
                Write-Host "Done `n"
            }
        }
    }
}
catch {
    Write-Error "An error occurred: $_"
}