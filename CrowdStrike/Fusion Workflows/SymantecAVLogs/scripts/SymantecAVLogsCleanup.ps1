# Get hostname
$Hostname = $env:COMPUTERNAME

# list items being removed
$items = @(
	"C:\temp\toutput\SymantecAVLogs=$Hostname.zip",
	"C:\Kape.zip",
	"C:\temp\toutput\SymantecAVLogs-$Hostname",
	"C:\Kape"
)

# For each item, verify it exists, remove it, confirm it's removed
foreach($item in $items) {
	if (Test-Path $item) {
		Remove-Item -Path $item -Recurse -Force
		Write-Output "Removed: $item"
	} else { #returns items that were not removed
		Write-Output "Not found: $item"
	}
}