# CrowdStrike Dashboards

This repository contains a collection of **CrowdStrike Falcon dashboards** designed to enhance visibility, accelerate investigations, and support proactive threat hunting. Each dashboard focuses on key use cases and detection opportunities within enterprise environments.

## Purpose

The purpose of this collection is to:

- Provide ready-to-use dashboards that highlight suspicious or high-risk behavior
- Support fast triage and contextual investigations
- Offer visual workflows aligned with threat hunting and incident response priorities
- Reduce dwell time by surfacing anomalies and patterns of concern
- Serve as templates for building custom dashboards tailored to your environment

## Dashboards

All dashboards are saved in a format compatible with CrowdStrike Falcon dashboards and include usage notes.

- **[Impossible Travel Dashboard](https://github.com/marthajsosa/marthajsosa/tree/main/CrowdStrike/Dashboards/ImpossibleTravel)**  
  Highlights login activity from geographically distant locations within an unrealistically short timeframe.  
  *Use Case:* Detect potential account compromise, VPN misuse, or adversary-in-the-middle attacks.

- **[Investigate Host Dashboard](./CrowdStrike/Dashboards/InvestigateHost.yaml)**  
  A focused one-pager to assist in quickly triaging a host.  
  *Use Case:* Understand recent activity, parent/child process relationships, network behavior, and login events tied to a specific host.

## Format

Each dashboard entry includes:

- **Purpose**  
- **Detection Opportunity**  
- **Filters/Widgets Used**  
- **Recommended Investigative Actions**

## Tools and Sources

These dashboards are designed for use with:

- **CrowdStrike Falcon dashboards**
- **Scheduled search widgets and investigation pivots**
- **CrowdStrike Real Time Response (RTR) and threat hunting modules**

## ⚠️ Disclaimer

Always test dashboards in a controlled environment before relying on them for operational use. Adapt filters and thresholds based on your organization’s structure and user behavior to minimize noise and improve signal quality.

## Contributions

Have a dashboard you want to share? Contributions are welcome! Submit your templates and use cases through a pull request.

