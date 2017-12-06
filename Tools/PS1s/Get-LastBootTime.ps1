Clear-Host
$BootTime = Get-WmiObject -Class Win32_OperatingSystem -ComputerName localhost |
Select-Object -Property CSName,@{n="LastBooted";
e={[Management.ManagementDateTimeConverter]::ToDateTime($_.LastBootUpTime)}}
Write-Host "last boot: $BootTime"
write-host ""
pause