# Define paths
$Hostname = $env:COMPUTERNAME
$FilePath = "C:\temp\moutput\BrowserHistory-$Hostname"
$FileExists = Test-Path $FilePath
$FileName = Split-Path $FilePath -Leaf
$TDest = "C:\temp\toutput\BrowserHistory-$Hostname"
$MSource = "C:\temp\toutput\BrowserHistory-$Hostname"
$MDest = "C:\temp\moutput\BrowserHistory-$Hostname"

# Run KAPE process
Start-Process -FilePath "C:\KAPE\KAPE\kape.exe" -ArgumentList @(
"--tsource", "C:",
"--target", "WebBrowsers",
"--tdest", $TDest,
"--msource", $MSource,
"--module", "SQLECmd",
"--mdest", $MDest,
"--trace", "--debug"
) -NoNewWindow -Wait -PassThru

$Output = @{
file_path = $FilePath
file_name = $FileName
exists = $FileExists
}

$Output | ConvertTo-Json -Depth 1