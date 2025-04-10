# PowerShell Scripts for Browser Artifact Collection

This directory contains the response scripts used in the Falcon Fusion workflow to collect web browser artifacts from Windows endpoints using KAPE and SQLECmd.

Each script is uploaded to CrowdStrike under:
**Host Setup and Management > Response Scripts and Files**

## Script Descriptions

### UnzipKAPE.ps1
Unzips the KAPE toolkit to `C:\KAPE` on the target machine.

### RemoveCurrentSQLECmdMaps.ps1
Deletes all existing SQLECmd map files to ensure a clean update.

### UpdateSQLECmdMaps.ps1
Fetches and applies the latest SQLECmd map files for accurate browser data parsing.

### GatherWebBrowserArtifacts.ps1
Runs KAPE with `WebBrowsers` and `SQLECmd` modules to collect history, cookies, and other data from Chrome, Edge, and Firefox.

### ZipWebBrowserHistory.ps1
Compresses the collected artifacts into a ZIP archive at:

## JSON Schemas

These JSON schemas are used to define inputs and validate outputs within the Falcon Fusion workflow.

### WorkflowTriggerJsonSchema.json (trigger schema)
Defines the required input for the workflow, typically an identifier such as hostname or asset tag.

### Custom Script Output Schemas
Used in two stages:
- **GatherWebBrowserArtifactsOutputSchema.json**: Validates that artifacts were successfully collected.
- **ZipWebBrowserHistoryJSONOutputSchema.json**: Confirms the ZIP file exists and is named correctly.
