# Falcon Fusion Workflow: Web Browser Artifact Collection

This repository documents a complete CrowdStrike Fusion workflow for collecting browser history artifacts using KAPE and SQLECmd. The workflow is designed to run on-demand against Windows endpoints and includes file validation, compression, and retrieval logic. This workflow utilizes Kroll's KAPE took which a free, open-source forensic tool.

## Purpose

Automates the retrieval of browser data such as:
- History
- Cookies
- Downloads
- Top Sites
- Keyword Searches (Google searches)
- History Visits
- Favicons
- Omnibox Shortcuts

Collected data is compressed and retrieved for forensic analysis.

## Workflow Overview

![Workflow](https://github.com/marthajsosa/marthajsosa/blob/main/CrowdStrike/Fusion%20Workflows/BrowserArtifactCollection/assets/WebBrowserHistory.png)

### Key Steps

1. **On-Demand Trigger**
2. **Device Details Lookup**
3. **Platform + Host Group Checks**
4. **Unzip KAPE**
5. **Remove SQLECmd Maps**
6. **Update SQLECmd Maps**
7. **Run KAPE with SQLECmd to collect browser artifacts**
8. **Zip the results**
9. **Check if file exists**
10. **Retrieve file**
11. **Send email if file is retrieved and under size limit**

## JSON Schemas

- `GatherWebBrowserArtifactsOutputSchema.json`: Defines the required fields (aid, hostname, asset tag)
- `ZipWebBrowserHistoryJSONOutputSchema.json`: Validates existence and name of the resulting artifact file

## Scripts

Each step is executed by a standalone PowerShell script, uploaded under **Host Setup and Management > Response Scripts and Files**.

See `/scripts` for:
- `UnzipKAPE.ps1`
- `RemobeCurrentSQLECmdMaps.ps1`
- `UpdateSQLECmdMaps.ps1`
- `GatherWebBrowserArtifacts.ps1`
- `ZipWebBrowserHistory.ps1`

