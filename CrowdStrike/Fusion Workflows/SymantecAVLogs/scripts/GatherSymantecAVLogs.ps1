# Define paths
$KapePath = "C:\KAPE\KAPE\kape.exe"
$Hostname = $env:COMPUTERNAME
$TDest = "C:\temp\toutput\SymantecAVLogs-$Hostname"

# Run KAPE process--there is no module for SymantecAVLogs
$process = Start-Process -FilePath $KapePath -ArgumentsList @(
	"--tsource", "C:",
	"--target", "Symantec_AV_Logs",
	"--tdest", $TDest,
	"--trace", "--debug"
) -NoNewWindow -Wait -Passthru

# Define output variables
$FileExists = Test=Path $FilePath
$FileName = Split-Path $FilePath -Leaf

# Create object for json output
$Output = @{
	file_path = $TDest
	file_name = $FileName
	exists = $FileExists
}

# Convert output to jason so fields can be used in later actions
$Output | ConvertTo-Json -Depth 1file