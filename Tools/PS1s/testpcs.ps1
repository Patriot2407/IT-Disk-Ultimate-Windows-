$errorcount = 0
$goodcount = 0
$pcs=Import-Csv C:\Scripts\PCs.csv
Foreach($PC in $pcs)
{
 if(!(Test-Connection -Cn $PC -BufferSize 16 -Count 1 -ea 0 -quiet))
 {
  write-host "Problem connecting to $PC" -foregroundcolor “yellow”
  "Flushing DNS"
  ipconfig /flushdns | out-null
  "Registering DNS"
  ipconfig /registerdns | out-null
 "doing an NSLookup for $PC"
  nslookup $PC
  "Re-pinging $PC"
    if(!(Test-Connection -Cn $PC -BufferSize 16 -Count 1 -ea 0 -quiet))
     {write-host "Problem still exists in connecting to $PC" -foregroundcolor “red”
        $errorcount= $errorcount + 1} 
      ELSE {write-host "Resolved problem connecting to $PC" -foregroundcolor “green”
            $goodcount = $goodcount + 1}  #end if
  } # end if
ELSE {write-host "No problems with: $PC" -foregroundcolor “green”
        $goodcount = $goodcount + 1}
} # end foreach
Write-Host ""
write-host "Computers that are down: $errorcount" -foregroundcolor “red”
Write-Host "Computers that are up: $goodcount" -foregroundcolor “green”
Write-Host ""
cmd /c pause