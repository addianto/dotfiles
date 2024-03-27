# WinGet Configuration

This directory contains the WinGet Configuration file for setting up my Windows machine.

## Required DSC Modules

- [`Microsoft.Windows.Developer`](https://www.powershellgallery.com/packages/Microsoft.Windows.Developer/0.2.1-alpha)
- [`Microsoft.WinGet.DSC`](https://www.powershellgallery.com/packages/Microsoft.WinGet.DSC/0.2.0-alpha)

## How to Use

```pwsh
winget configure --file .\configurations\configuration.dsc.yaml
```
