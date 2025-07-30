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
    $id = $_.Groups[1].Value
    $versionPattern = "Id:\s*$id\s*\n\s*Version:\s*([^\s]+)"

    # Check if the version is pinned
    if ([regex]::IsMatch($yamlContent, $versionPattern)) {
        Write-Output "Skipping $id (version is pinned)"
    } else {
        Write-Output "Upgrading $id"
        winget upgrade --disable-interactivity --id "$id"
    }
}