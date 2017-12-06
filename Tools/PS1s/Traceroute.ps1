function Invoke-Tracert {
    param([string]$RemoteHost)

    tracert $RemoteHost |ForEach-Object{
        if($_.Trim() -match "Tracing route to .*") {
            Write-Host $_ -ForegroundColor Green
        } elseif ($_.Trim() -match "^\d{1,2}\s+") {
            $n,$a1,$a2,$a3,$target,$null = $_.Trim()-split"\s{2,}"
            $Properties = @{
                HopCount = $n;
                Latency1 = $a1;
                Latency2 = $a2;
                Latency3 = $a3;
                Node = $target
            }
            New-Object psobject -Property $Properties
        }
    }
}
Clear-Host
Write-Host ""
$Trace = Read-Host -Prompt "End point of trace "
Add-Type -AssemblyName System.Windows.Forms 
$Form = New-Object system.Windows.Forms.Form
$Label = New-Object System.Windows.Forms.Label
$Form.Controls.Add($Label)
$Label.Text = "parsing, please wait...
Unfortunately, this can take some time. Traceroute 
is tracing all nodes, and then once the trace has 
been properly formatted, it will then proceed to show 
you the results. Please be patient."
$Label.AutoSize = $True
$Form.Visible = $True
$Form.Update()
Invoke-Tracert -RemoteHost $Trace | Format-Table -Wrap -AutoSize HopCount,Latency1,Latency2,Latency3,Node
#Hide popup
$Form.Close()
pause