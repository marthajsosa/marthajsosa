# Define variables
$Hostname = $env:COMPUTERNAME
$FolderPath = "C:\temp\moutput\BrowserHistory-$Hostname"
$FilePath = "C:\temp\moutput\BrowserHistory-$Hostname.zip"
$FileName = Split-Path $FilePath -Leaf
$Timeout = 600 # 10 minutes timeout in seconds--keeps action from timing out in workflow
$Interval = 5 # Check every 5 seconds
$ElapsedTime = 0

try {
# Run the compression as a background job
Start-Job -ScriptBlock {
param ($FolderPath, $FilePath)
try {
Compress-Archive -Path $FolderPath -DestinationPath $FilePath -Force | Out-Null
} catch {
Write-Output "Compression failed: $_"
}
} -ArgumentList $FolderPath, $FilePath | Out-Null

# Wait for the zip file to be created or timeout
while (-not (Test-Path $FilePath) -and $ElapsedTime -lt $Timeout) {
Start-Sleep -Seconds $Interval
$ElapsedTime += $Interval
}

# Check if the file exists after waiting
$FileExists = Test-Path $FilePath

# Output JSON response so fields can be used in later actions
$Output = @{
file_path = $FilePath
file_name = $FileName
exists = $FileExists
}

# Converts output to json
$Output | ConvertTo-Json -Depth 1 -Compress
} catch {
Write-Output "An error occurred: $_"
}