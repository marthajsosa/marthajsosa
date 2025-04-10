
## 🚧 Work in Progress
# CrowdStrike Queries

This repository contains a collection of **CrowdStrike Falcon threat hunting queries**. These queries are designed to help defenders proactively hunt for malicious activity, uncover suspicious behavior, identify early signs of compromise across the enterprise, and drive continual improvement of the overall security posture.

## Purpose

The purpose of this collection is to:

- Accelerate proactive threat hunting efforts  
- Provide reusable, tested queries aligned with MITRE ATT&CK techniques  
- Support detection engineering and hypothesis-driven investigations  
- Build a foundation for automated detections and response workflows  
- Provide collection of potential scheduled **Falcon SOAR** automated workflows  

## Organization by MITRE ATT&CK IDs

All threat hunting queries in this repository are organized by **MITRE ATT&CK Tactics and Techniques**, following the [MITRE ATT&CK Enterprise Matrix](https://attack.mitre.org/matrices/enterprise/). Each folder corresponds to a tactic, and individual files are named by their technique ID and purpose.

- **[Initial Access](https://github.com/marthajsosa/marthajsosa/tree/main/CrowdStrike/Queries/Initial%20Access)**  
  Techniques adversaries use to gain an initial foothold.  
  *Examples:* Malicious documents, macro execution, suspicious file drops

- **Execution**  
  Techniques for running malicious code.  
  *Examples:* Unusual scripting (PowerShell, Python, WScript), LOLBins

- **Persistence**  
  Methods used to maintain access to compromised systems.  
  *Examples:* Registry autoruns, scheduled tasks, unusual services

- **Privilege Escalation**  
  Techniques to gain higher-level permissions.  
  *Examples:* Token manipulation, UAC bypass attempts

- **Defense Evasion**  
  Techniques to avoid detection and bypass security controls.  
  *Examples:* Obfuscated commands, clearing logs, disabling security tools

- **Credential Access**  
  Techniques for stealing credentials.  
  *Examples:* LSASS access, Mimikatz patterns, password dumping

- **Discovery**  
  Techniques to gather information about the environment.  
  *Examples:* Network scanning, account enumeration, AD probing

- **Lateral Movement**  
  Techniques used to move across systems within a network.  
  *Examples:* RDP usage, pass-the-hash behavior, SMB sessions

- **Collection & Exfiltration**  
  Techniques for gathering and extracting data.  
  *Examples:* File staging, cloud sync usage, compression utilities

- **Command & Control**  
  Techniques to communicate with and control compromised hosts.  
  *Examples:* Beaconing patterns, dynamic DNS, tunneling behavior

## Format

Each query entry includes:

- **MITRE ATT&CK Technique**  
- **Query Description**  
- **Use Case**  
- **Detection Opportunity**

## Tools and Sources

These queries are designed for use with:

- **CrowdStrike dashboards, scheduled searches, and scheduled workflows**  
- **Custom detection logic/Custom IOAs and alerting workflows**

## Contributions

Contributions are welcome!
