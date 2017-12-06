clear-host
Get-Variable -Exclude PWD,*Preference | Remove-Variable -EA 0
clear-host
if (!(Test-Path "C:\Scripts")) {
Write-Host "Just and FYI, IT Ultimate Disk is NOT installed on this machine. Running program in Disc mode."
$DiscMode=1
pause
}
ELSE{
Write-Host "IT Ultimate Disk IS installed on this machine"
$DiscMode=0}
Write-Host "The Preflight-check has succesfully completed"
pause