oh-my-posh init pwsh --config "agnoster" | Invoke-Expression

# Prerequisite: Install-Module git-completion
Import-Module git-completion

Set-Alias -Name docker -Value podman
