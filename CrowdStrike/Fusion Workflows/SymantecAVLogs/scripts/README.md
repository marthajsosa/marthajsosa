# PowerShell Scripts for Symantec AV Log Collection

This directory contains the response scripts used in the **Falcon Fusion workflow** to collect **Symantec Antivirus logs** from Windows endpoints using **KAPE**.

Each script is uploaded to CrowdStrike under:  
**Host Setup and Management > Response Scripts and Files**

---

## Script Descriptions

### UnzipKAPE.ps1
Unzips the KAPE toolkit to `C:\KAPE` on the target machine.

### GatherSymantecAVLogs.ps1
Runs KAPE using a custom target to collect Symantec AV logs such as:
- `AVMan.log`
- `SAVLogs.txt`
- Quarantine details
- Other relevant Symantec folders/files

### ZipSymantecAVLogs.ps1
Compresses the collected Symantec logs into a ZIP archive for transfer and analysis.

---

## JSON Schemas

These JSON schemas are used to define inputs and validate outputs within the Falcon Fusion workflow.

### WorkflowTriggerJsonSchema.json
Defines the required input for the workflow trigger, such as:
- `aid` (agent ID)

### Custom Script Output Schemas
Used in two stages of the workflow:
- **GatherSymantecAVLogsOutputSchema.json**: Validates that AV logs were successfully collected.
- **ZipSymantecAVLogsOutputSchema.json**: Confirms the ZIP file was created and named correctly.
