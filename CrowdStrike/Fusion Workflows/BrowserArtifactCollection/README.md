# Falcon Fusion Workflow: Symantec AV Log Collection

This repository documents a complete **CrowdStrike Fusion** workflow for collecting **Symantec Antivirus logs** from Windows endpoints using **KAPE**. The workflow is designed to run **on-demand** and includes file validation, compression, and retrieval logic. It uses Kroll's [KAPE](https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape), a free, open-source forensic triage tool.

---

## Purpose

Automates the retrieval of **Symantec AV logs** from endpoints for incident response and forensic analysis.  
This allows defenders to:

- Review recent detections, quarantines, and termiated processes to verify activity
- Investigate signature updates
- Identify tampering or unusual AV activity
- Support malware incident correlation
- Supplement root cause analsis
- Initiate log collection upon host visibility or specified event-based triggers

---

## Workflow Overview

add pic

---

### Key Steps

1. **On-Demand Trigger**
2. **Device Details Lookup**
3. **Platform + Host Group Checks**
4. **Unzip KAPE**
7. **Run KAPE - Symantec AV logs**
8. **Zip the output folder**
9. **Check if file exists**
10. **Retrieve the zipped logs**
11. **Send email if logs are retrieved and under size limit**
12. **Cleanup**

---

## JSON Schemas

- `GatherSymantecAVLogsOutputSchema.json`: Validates inputs such as `aid`, `hostname`, and log path
- `ZipSymantecAVLogsOutputSchema.json`: Ensures output file path, name, and existence are captured

---

## Scripts

Each step is executed by a standalone PowerShell script, uploaded under:

**CrowdStrike Console → Host Setup and Management → Response Scripts and Files**

Scripts used in this workflow:

- `UnzipKAPE.ps1`
- `GatherSymantecAVLogs.ps1`
- `ZipSymantecAVLogs.ps1`
