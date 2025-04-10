# Initial Access

## MITRE ATT&CK Technique
### T1078 Valid Accounts
<blockquote>Adversaries may obtain and abuse credentials of existing accounts as a means of gaining Initial Access, Persistence, Privilege Escalation, or Defense Evasion.</blockquote>

#### Query Description
<blockquote>This query filters for user login events by UserName and displays activity on a world map</blockquote>

```
// Filtering across all customer ids for logon and logoff events
#repo=base_sensor cid="*"  | in(#event_simpleName, values=[UserLogon, UserLogoff])
// Gathering events for one UserName
| in(UserName, values=[?{UserName="*"}], ignoreCase=true)
// Grouping logon/logoff events by UserName, LogonType, LogonTime, and Agent IP and keeping only the latest value for each
| groupBy([UserName, LogonType, LogonTime, "Agent IP"])
// Making logon code human-readable
| match("falcon/investigate/LogonType.csv", field=LogonType, column=LogonType_decimal, include=[LogonType], strict=false)
// Visualizing user logon activity on a world map by IP
| worldMap(ip="Agent IP")
```

#### **Use Cases**
- Detecting unusual geolocations for user login activity
- Identifiy Logon Types to detect lateral movement
- Validate Geofencing controls
- Data Enrichment

#### **Detection Opportunities**
  - Suspicious geolocation logins
  - Impossible travel
  - Brute force attacks


