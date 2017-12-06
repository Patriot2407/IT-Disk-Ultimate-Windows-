Clear-Host
Write-Host "Ping Range"
$Up = 0
$Down = 0
$Subnet = Read-Host -Prompt "Input first three octets (X.X.X) "
[int]$start = Read-host -Prompt "Starting IP last octet (X.X.X.<This number>) "
[int]$end = Read-host -Prompt "Last IP last octet (X.X.X.<This number>) "
$ping = 1
while ($start -le $end) {
$IP = "$Subnet.$start"
Write-Host "Pinging $IP" -ForegroundColor Cyan
try
{
$status = Test-Connection -ComputerName $IP -count 3 -Quiet
}
catch
{
write-host "ERROR DETECTED!" -ForegroundColor Red
<# write-host "$($_.Exception.GetType().FullName)" -ForegroundColor Red #>
write-host "$($_.Exception.Message)" -ForegroundColor Red
$ErrorExit = Read-host -Prompt "Press ENTER to acknowledge and exit"
exit
exit
exit
}
if ($status -eq $False) {write-host "Timed out" -ForegroundColor Red
$Down = $Down + 1}
Else {write-host "Host is up" -ForegroundColor Green
$Up = $Up +1}
Write-Host
$start++
}
Write-Host "----------------------------------------------------"
Write-Host "Total Devices contacted = $Up" -ForegroundColor Green
Write-Host
Write-Host "Total Devices Timed out = $Down" -ForegroundColor Red
$Exit = Read-host -Prompt "Press ENTER to exit"
exit