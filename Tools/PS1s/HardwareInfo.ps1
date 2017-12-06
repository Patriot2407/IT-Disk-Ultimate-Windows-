Clear-Host
$bios = Get-WmiObject -Class Win32_BIOS -ComputerName .
$cpu = Get-WmiObject -Class Win32_Processor -ComputerName . | Select-Object -Property [a-z]*
$architecture = Get-WmiObject -Class Win32_ComputerSystem -ComputerName . | Select-Object -Property SystemType 
[string]$makeandmodel = Get-WmiObject -Class Win32_ComputerSystem
$Users = Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property NumberOfLicensedUsers,NumberOfUsers,RegisteredUser
$servicees = Get-WmiObject -Class Win32_Service -ComputerName . | Format-Table -Property Status,Name,DisplayName -AutoSize -Wrap
<#
Write-Host "Bios -->"
Write-Host "$bios"
Write-Host ""
# Write-Host "CPU --> $cpu"
# Write-Host ""
Write-Host "Architecture --> "
Write-Host "$architecture"
Write-Host ""
Write-Host "Make and Model --> "
Write-Host "$makeandmodel"
Write-Host ""
Write-Host "Users --> "
Write-Host "$Users"
Write-Host ""
Write-Host "Services --> "
Write-Host "$services"
#>
Write-Host "Output is in pop-up window"
Write-Host "The Script will not continue until you accept the pop-up window."
$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("Architecture -->
$architecture

Make and Model -->
$makeandmodel

Users -->
$Users

Services -->
$services")
pause