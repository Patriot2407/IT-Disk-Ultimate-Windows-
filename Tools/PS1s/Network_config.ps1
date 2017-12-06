Clear-Host
cls
Write-Host "Network config"
$simple = ipconfig
$detailed = ipconfig /all
Write-host "Simple"
Write-Host $simple | Format-Table -Property * -AutoSize
Write-Host ""
pause
cls
Write-Host "More complex"
Write-Host $detailed | Format-Table
Write-Host ""
pause