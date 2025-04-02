# 🎯 CrowdStrike Queries

This repository contains a collection of **CrowdStrike Falcon threat hunting queries**. These queries are designed to help defenders proactively hunt for malicious activity, uncover suspicious behavior, identify early signs of compromise across the enterprise, and drive continual improvement of the overall security posture.

## 🔍 Purpose

The purpose of this collection is to:

- Accelerate proactive threat hunting efforts
- Provide reusable, tested queries aligned with MITRE ATT&CK techniques
- Support detection engineering and hypothesis-driven investigations
- Build a foundation for automated detections and response workflows
- Provide collection of potential scheduled **Falcon SOAR** automated workflows

## 📁 Organization by MITRE ATT&CK IDs

All threat hunting queries in this repository are organized by **MITRE ATT&CK Tactics and Techniques**, following the [MITRE ATT&CK Enterprise Matrix](https://attack.mitre.org/matrices/enterprise/). Each folder corresponds to a tactic, and individual files are named by their technique ID and purpose.

- **Initial Access**
  - Malicious documents, macro execution, suspicious file drops
- **Execution**
  - Unusual scripting (PowerShell, Python, WScript), LOLBins
- **Persistence**
  - Registry autoruns, scheduled tasks, unusual services
- **Privilege Escalation**
  - Token manipulation, UAC bypass attempts
- **Defense Evasion**
  - Obfuscated commands, clearing logs, disabling security tools
- **Credential Access**
  - LSASS access, Mimikatz patterns, password dumping
- **Discovery**
  - Network scanning, account enumeration, AD probing
- **Lateral Movement**
  - RDP usage, pass-the-hash behavior, SMB sessions
- **Collection & Exfiltration**
  - File staging, cloud sync usage, compression utilities
- **Command & Control**
  - Beaconing patterns, dynamic DNS, tunneling behavior

## 📁 Format

Each query entry includes:

- **MITRE ATT&CK Technique**
- **Query Description**
- **Use Case**
- **Detection Opportunity**

## 🧰 Tools and Sources

These queries are designed for use with:

- **CrowdStrike dashboards, scheduled searches, and scheduled workflows**
- **Custom detection logic/Custom IOAs and alerting workflows**

## ⚠️ Disclaimer

Always test queries in a development or non-production environment before use in live environments. Adjust filters and conditions based on your organizational context to reduce false positives.

## 🧩 Contributions

Contributions are welcome! Share your own hunting queries, improvements, or detections via pull requests.
