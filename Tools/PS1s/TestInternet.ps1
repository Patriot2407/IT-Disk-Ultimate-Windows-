Function Test-InternetConnection {
[cmdletbinding(
    DefaultParameterSetName = 'Site'
)]
param(
    [Parameter(
        Mandatory = $True,
        ParameterSetName = '',
        ValueFromPipeline = $True)]
        [string]$Site,
    [Parameter(
        Mandatory = $True,
        ParameterSetName = '',
        ValueFromPipeline = $False)]
        [Int]$Wait
    )
    #Clear the screen
    Clear
    #Start testing the connection and continue until the connection is good.
    $count = 1
    $tries = 3 # <--- only edit this for Tries desired
    $Totaltries = $tries + 1
    if (!(Test-Connection -computer $site -count 1 -quiet))
    {
    do {(Test-Connection -computer $site -count 1 -quiet)
        Write-Host -ForegroundColor Red "Connection to $site [$siteIP] is down..."
        Write-Host -ForegroundColor Red "Attempt number ($count/$tries) failed."
        Start-Sleep -Seconds $wait
        $count = $count + 1
        }
        while ($count -lt $Totaltries)
        }
    #Connection is good
    if ((Test-Connection -computer $site -count 1 -quiet)){
    Write-Host -ForegroundColor Green "$(Get-Date): Connection to $site [$siteIP] is up!"}
}
Clear-Host
$siteIP = ""
$site = Read-Host -Prompt "Site to test (Example: google.com) "
$siteIP = [System.Net.Dns]::GetHostAddresses(“$site“)
Test-InternetConnection -Site $site -Wait 2
Write-Host ""
pause