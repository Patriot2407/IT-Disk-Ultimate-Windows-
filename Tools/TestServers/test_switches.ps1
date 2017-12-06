
<#---------------------------------------------------- DO NOT EDIT BELOW THIS LINE ----------------------------------------------#>
cls
<#---------- Declared Vars -------------#>
$errorcount = 0
$goodcount = 0
$servers = ""
<#---------- Declared Vars -------------#>
$scriptpath = $MyInvocation.MyCommand.Path #<---------------
$dir = Split-Path $scriptpath              #<----- These 3 lines get the script's directory and sets it to look for the csv file.
$csv_file = "$dir\switchlist.csv"          #<---------------
$csv = Import-Csv $csv_file                #<----- imports the csv data.
foreach($item in $csv)
    {
    $servers = $servers + "$($item.switches)" + ','
    }
$servers = $servers.Substring(0,$servers.Length-1)   #  Removes last ','
$servers = $servers.split(',')   #  Converts $servers into a useable string
Foreach($s in $servers)
{
 if(!(Test-Connection -Cn $s -BufferSize 16 -Count 1 -ea 0 -quiet))
 {
  write-host "Problem connecting to $s" -foregroundcolor “yellow”
  "Flushing DNS"
  ipconfig /flushdns | out-null
  "Registering DNS"
  ipconfig /registerdns | out-null
 "doing an NSLookup for $s"
  nslookup $s
    if(!(Test-Connection -Cn $s -BufferSize 16 -Count 1 -ea 0 -quiet))
     {write-host "Problem still exists in connecting to $s" -foregroundcolor “red”
        $errorcount= $errorcount + 1} 
      ELSE {write-host "Resolved problem connecting to $s" -foregroundcolor “green”
            $goodcount = $goodcount + 1}  #end if
  } # end if
ELSE {write-host "No problems with: $s" -foregroundcolor “green”
        $goodcount = $goodcount + 1}
} # end for each
Write-Host ""
write-host "--------------------------" -foregroundcolor “red”
write-host "Switches that are down: $errorcount" -foregroundcolor “red”
write-host "--------------------------" -foregroundcolor “red”
Write-Host ""
write-host "--------------------------" -foregroundcolor “green”
Write-Host "Switches that are up: $goodcount" -foregroundcolor “green”
write-host "--------------------------" -foregroundcolor “green”
Write-Host ""
write-host "Press any key to end this script." -ForegroundColor White 
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") # Do not continue until a key is pressed.
exit