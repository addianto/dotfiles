# WinGet Configuration

This directory has a WinGet Configuration file used to set up software packages on a Windows machine.

## Required DSC Modules

- [`Microsoft.Windows.Developer`](https://www.powershellgallery.com/packages/Microsoft.Windows.Developer/0.2.1-alpha)
- [`Microsoft.WinGet.DSC`](https://www.powershellgallery.com/packages/Microsoft.WinGet.DSC/0.2.0-alpha)

## How to Use

To use, execute the following command:

```pwsh
winget configure --file .\configurations\configuration.dsc.yaml
```

## References

- [`microsoft/devhome`](https://github.com/microsoft/devhome/tree/main/docs/sampleConfigurations)
  and [`oliverlabs/winget-dsc-examples`](https://github.com/oliverlabs/winget-dsc-examples)
  contain some WinGet DSC examples
