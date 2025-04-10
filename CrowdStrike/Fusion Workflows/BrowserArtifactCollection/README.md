# Falcon Fusion Workflow: Browser Artifact Collection

This project contains a CrowdStrike Falcon Fusion workflow and associated response scripts for collecting web browser artifacts using KAPE and SQLECmd.

## Purpose

The workflow performs a structured collection of browser history and related SQLite data from supported web browsers (Chrome, Edge, Firefox) on Windows endpoints.

## Workflow Sequence

1. **Unzip KAPE**
   - Deploy and extract KAPE on target host

2. **Remove Current Maps from SQLECmd**
   - Deletes existing map files to ensure a clean update

3. **Update SQLECmd Maps**
   - Retrieves the latest SQLECmd map files for accurate parsing

4. **Grab Web Browser Artifacts**
   - Uses KAPE and target modules to collect browser artifacts

5. **Zip Web Browser History**
   - Compresses extracted artifacts into a portable archive for analysis

## Requirements

- Falcon RTR with scripting permissions
- Windows host with PowerShell
- KAPE modules pre-uploaded or available via `unzip KAPE` step
- Uploaded scripts in Falcon Console under Host Setup and Management

## Output

A ZIP file containing browser history artifacts will be saved to:


