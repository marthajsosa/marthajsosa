# Define variables
$Hostname - $env:COMPUTERNAME
$FolderPath = "C:\temp\toutput\SymantecAVLogs-$Hostname"
$FilePath = "C:\temp\toutput\SymantecAVLogs-$Hostname.zip"
$FileName = Split-Path $FilePath -Leaf
$Timeout = 600 # prevents timeing out in workflow 
$Interval = 5
$ElapsedTime = 0

try{
	# run the compression as a background job
	Start-Job -ScriptBlock {
		param ($DirPath, $FilePath)
		try {
			Compress-Archive -Path $DirPath -DestiationPath $FilePath -Force | Out-Null
		} catch {
			Write-Output "Compression failed: $_"
		}
	} -ArgumentList $DirPath, $FilePath | Out-Null

	# Wait for the zip file to be created or time out
	while (-not(Test-Path $FilePath) -and $ElapsedTime -lt $Timeout) {
		Start-Sleep -Seconds $Interval
		$ElapsedTime += $Interval
	}

	# Check if the file exists after waiting
	$FileExists = Test-Path $FilePath

	#output json
	$Output = @{
		file_path = $FilePath
		file_name = $FileName
		exists = $FileExists
	}
# Converts output to json
	$Output | ConvertTo-Json -Depth 1 -Compress
	