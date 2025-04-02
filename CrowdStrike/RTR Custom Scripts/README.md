
## 🚧 Work in Progress
# ⚡ CrowdStrike RTR PowerShell Scripts

This repository contains a growing collection of **CrowdStrike Real Time Response (RTR) PowerShell scripts** designed to automate common investigative and remediation tasks in CrowdStrike Falcon.

These scripts leverage the **PSFalcon** module and CrowdStrike's Real Time Response APIs to run commands remotely, collect forensic data, and respond to endpoint threats in a scalable and efficient manner.

## 🎯 Purpose

The goal of this project is to provide repeatable, tested, and customizable PowerShell scripts to streamline incident response using RTR.

Use cases include:

- Collecting artifacts with tools like KAPE or Cloudfiles
- Dumping memory or grabbing persistence mechanisms
- Clearing credentials or disabling accounts
- Uploading and executing custom tools (Put-and-run)

## 🛠️ Prerequisites

Before using these scripts, ensure you have the following:

- Access to **CrowdStrike Falcon API** with permissions to run RTR commands
- The **PSFalcon** PowerShell module installed  
  `Install-Module -Name PSFalcon`

- Your Falcon API credentials configured:  
  `Request-FalconToken -ClientId 'your_id' -ClientSecret 'your_secret'`

## 📁 Script Categories

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

## 📌 Examples

Example usage of a KAPE triage script:
```powershell
example
```

Example: Clear stored credentials via scheduled task:
```powershell
example
```


- Always test scripts in a **non-production** environment first.

- Contributions are welcome! Feel free to submit PRs or share your own scripts and workflows.

## 🚧 Work in Progress

This project is actively maintained and new scripts are being added regularly. Check back for updates.
