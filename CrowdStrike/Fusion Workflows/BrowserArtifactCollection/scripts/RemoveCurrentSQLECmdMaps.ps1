$maps = @(
    "C:\KAPE\KAPE\Modules\bin\SQLECmd\Maps"
)
foreach ($map in $maps) {
    if (Test-Path $map) {
        Remove-Item -Path $map -Recurse -Force
        Write-Output "Removed: $map"
    } else {
        Write-Output "Not found: $map"
    }
}