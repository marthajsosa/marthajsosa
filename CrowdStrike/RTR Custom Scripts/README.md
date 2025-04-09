
## 🚧 Work in Progress
# CrowdStrike RTR PowerShell Scripts

This repository contains a growing collection of **CrowdStrike Real Time Response (RTR) PowerShell scripts** designed to automate common investigative and remediation tasks in CrowdStrike Falcon.

These scripts leverage the **PSFalcon** module and CrowdStrike's Real Time Response APIs to run commands remotely, collect forensic data, and respond to endpoint threats in a scalable and efficient manner.

## Purpose

The goal of this project is to provide repeatable, tested, and customizable PowerShell scripts to streamline incident response using RTR.

Use cases include:

- Collecting artifacts with tools like KAPE or Cloudfiles
- Dumping memory or grabbing persistence mechanisms
- Clearing credentials or disabling accounts
- Uploading and executing custom tools (Put-and-run)

## Prerequisites

Before using these scripts, ensure you have the following:

- Access to **CrowdStrike Falcon API** with permissions to run RTR commands
- The **PSFalcon** PowerShell module installed  
  `Install-Module -Name PSFalcon`

- Your Falcon API credentials configured:  
  `Request-FalconToken -ClientId 'your_id' -ClientSecret 'your_secret'`

## Script Categories

Scripts are organized into the following types:

- **Collection**
  - Run tools like KAPE, Autoruns, or custom collectors
- **Analysis**
  - Pull registry keys, run scans, or check running processes
- **Remediation**
  - Kill processes, delete files, or clear stored credentials
- **Persistence**
  - Detect common persistence mechanisms
- **Automation**
  - Schedule tasks for follow-up actions or data collection

## Examples

Example usage of uploading and extracting local KAPE file to host and extracting:
```powershell
#Requires -Version 5.1
using module @{ModuleName='PSFalcon';ModuleVersion='2.2'}
<#
.SYNOPSIS
Upload and extract a ZIP archive containing KAPE into the C:\ directory of target hosts using CrowdStrike RTR.

.DESCRIPTION
This script uploads a ZIP archive (e.g., KAPE.zip) and then extracts it into C:\ using a secondary process launched
from within Real-time Response, avoiding timeout limitations.

.PARAMETER ZipPath
Path to the local ZIP file containing KAPE

.PARAMETER HostId
One or more host identifiers

.NOTES
Ensure the ZIP file is structured such that its contents extract cleanly into C:\KAPE or desired subfolder.

#>
[CmdletBinding()]
param(
  [Parameter(Mandatory, Position=1)]
  [ValidateScript({ Test-Path $_ })]
  [string]$ZipPath,

  [Parameter(Mandatory, Position=2)]
  [ValidatePattern('^[a-fA-F0-9]{32}$')]
  [string[]]$HostId
)

begin {
  # Read the ZIP file and convert to base64
  $Base64Zip = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($ZipPath))
  $TempScript = @"
\$zipData = '$Base64Zip'
\$bytes = [Convert]::FromBase64String(\$zipData)
\$outputPath = 'C:\\KAPE.zip'
\$extractPath = 'C:\\KAPE'

# Remove existing KAPE folder
if (Test-Path \$extractPath) {
    Remove-Item -Path \$extractPath -Recurse -Force
}

# Remove existing KAPE.zip file
if (Test-Path \$outputPath) {
    Remove-Item -Path \$outputPath -Force
}

# Write new ZIP file
[IO.File]::WriteAllBytes(\$outputPath, \$bytes)

# Expand forcibly
Expand-Archive -Path \$outputPath -DestinationPath \$extractPath -Force

# Clean up
Remove-Item \$outputPath
"@

  # Encode the PowerShell script
  $EncodedScript = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($TempScript))
}

process {
  $Param = @{
    Command  = 'runscript'
    Argument = '-Raw=```Start-Process -FilePath powershell.exe -ArgumentList "-EncodedCommand ' + $EncodedScript + '"```'
    HostId   = $HostId
  }
  Invoke-FalconRtr @Param
}

```

Example: 
```powershell
example
```


- Always test scripts in a **non-production** environment first.

- Contributions are welcome! Feel free to submit PRs or share your own scripts and workflows.

## 🚧 Work in Progress

This project is actively maintained and new scripts are being added regularly. Check back for updates.
