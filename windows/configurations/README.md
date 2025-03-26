# WinGet Configuration

This directory contains WinGet Configuration files used to set up software packages on a Windows machine.

## Required DSC Modules

Install the following DSC modules before running the WinGet Configuration files:

- [`Microsoft.Windows.Developer`](https://www.powershellgallery.com/packages/Microsoft.Windows.Developer/0.2.1-alpha)
- [`Microsoft.WinGet.DSC`](https://www.powershellgallery.com/packages/Microsoft.WinGet.DSC/1.8.1133-alpha)
- [`xPSDesiredStateConfiguration `](https://www.powershellgallery.com/packages/xPSDesiredStateConfiguration/9.2.0-preview0008)

To install the modules, run:

```pwsh
Install-Module -Name Microsoft.Windows.Developer -AllowPrerelease
Install-Module -Name Microsoft.WinGet.DSC -AllowPrerelease
Install-Module -Name xPSDesiredStateConfiguration -AllowPrerelease
```

## How to Use

To use the configuration files, execute the following commands:

```pwsh
winget configure --file .\configurations\setupMachine.dsc.yaml
winget configure --file .\configurations\setupCommon.dsc.yaml
winget configure --file .\configurations\setupDevTools.dsc.yaml
winget configure --file .\configurations\setupOfficeTools.dsc.yaml
```

Some configuration files are optional, such as those for setting up [LLM](./setupLLM.dsc.yaml).

## References

- [`microsoft/devhome`](https://github.com/microsoft/devhome/tree/main/docs/sampleConfigurations)
  and [`oliverlabs/winget-dsc-examples`](https://github.com/oliverlabs/winget-dsc-examples)
  contain some WinGet DSC examples
