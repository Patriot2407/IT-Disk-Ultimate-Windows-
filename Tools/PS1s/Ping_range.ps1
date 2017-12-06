Clear-Host
$i = 1
$IPadd = "192.168.0"
Do {
$IPHost = $IPadd + $i
    try {$Pingo = Get-WMIObject Win32_PingStatus -f "Address ='$IPHost'" 
         $Pingo | Format-Table Address, StatusCode  -auto;$i++ }
    catch{write-host "ERROR DETECTED!" -ForegroundColor Red
<# write-host "$($_.Exception.GetType().FullName)" -ForegroundColor Red #>
write-host "-->$($_.Exception.Message)<--" -ForegroundColor Red
    }
}
until ($1 -eq 255)
$Exit = Read-host -Prompt "Press ENTER to exit"
exit