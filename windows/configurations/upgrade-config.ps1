param (
    [string]$yamlPath
)

if (-not $yamlPath) {
    Write-Error "Please provide the path to a WinGet Configuration YAML file."
    exit 1
}

# Load the YAML file
$yamlContent = Get-Content -Path $yamlPath -Raw

# Define the regular expression pattern to match the "Id" elements
$pattern = 'Id:\s*([^\s]+)'

# Find all matches and upgrade them
$matches = [regex]::Matches($yamlContent, $pattern)
$matches | ForEach-Object {
    Write-Output "Upgrading $_.Groups[1].Value"
    winget upgrade --disable-interactivity --id "$_.Groups[1].Value"
}