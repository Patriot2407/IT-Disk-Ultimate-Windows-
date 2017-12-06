$psversion = $PSVersionTable.PSVersion.Major
$psversionspecific = $PSVersionTable.PSVersion
<#Requires -Version 5#>
<#------------------------------------------- Start Declared Vars ---------------------------------------------------------------------#>
$mypath = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)
$mypath = [string]$mypath
[string]$Author = 'Czebiniak'
[string]$AuthorDate = '2017'
$location = (Split-Path $MyInvocation.InvocationName)
<#------------------------------------------- End Declared Vars -----------------------------------------------------------------------#>
<#---------------------------- CLEAR --------------------------------------#>

[system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")
[System.Windows.Forms.SendKeys]::Sendwait('%{F7 2}')
Clear-History
clear-Host
cls
<#---------------------------- END CLEAR --------------------------------------#>
<#------------------------------------------- Start Declared Functions ---------------------------------------------------------------------#>
function Quit
{
Write-Host ""
# $Exit = Read-Host "Press any key to quit"
# $DoNotContinue = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") # Do not continue until a key is pressed.
Write-Host "Exiting..."
sleep 1
exit
# $host.SetShouldExit()
}
function InstallWMF5
{
Write-Host "Welcome to the built in Powershell updater. I take no responsibility for anything that happens next :)"
$ps5x64 = $location + "..\..\WMF5\win7x64.msu"
$ps5x86 = $location + "..\..\WMF5\win7x86.msu"
if ([System.Environment]::Is64BitProcess) {
Write-Host "x64 architecture detected, running 64-bit installer..."
wusa $ps5x64 /quiet /norestart | Out-Null
} else {
Write-Host "x86 architecture detected, running 32-bit installer..."
wusa $ps5x86 /quiet /norestart | Out-Null
}
Write-Host "Hopefully ps5 was installed, and correctly, and you did not run into any problems. To check, reboot, and run this script again."
pause
}
    If($PSVersionTable.PSVersion.Major -le 4) {
    Write-Host "The script will not continue until you accept the pop-up window..."
    $wshell = New-Object -ComObject Wscript.Shell
    $wshell.Popup("I have detected that you are running on powershell $psversion ($psversionspecific to be more specific). This can cause problems with various scipts. This script has not been tested with any version below 5.0, Please execute this script from a system that has PowerShell 5.0 or newer installed.") 
    $input = Read-Host "If you want to try to install powershell 5 via my built-in installer, please input a y, otherwise hit enter to continue"
                 if ($input -eq "y"){InstallWMF5}
                 else {Quit}
        }
function Show-Skill
{
     param ([string]$Title = 'Skill Level')
     cls
     Write-Host "================ $Title ================" -ForegroundColor green
     Write-Host "1: Press '1' for Expert" -ForegroundColor Magenta
     Write-Host "2: Press '2' for Pro" -ForegroundColor Cyan
     Write-Host "3: Press '3' for Average" -ForegroundColor DarkYellow
     Write-Host "4: Press '4' for Dummy" -ForegroundColor Magenta
     Write-Host "5: Press '5' for Army" -ForegroundColor Cyan
}
function Show-Menu
{
     param (
           [string]$Title = 'IT Helpdesk Disk Ultimate Main Menu'
     )
     cls
     Write-Host "================ $Title ================"  -ForegroundColor green
     Write-Host "Authored by: $Author, $AuthorDate" -ForegroundColor white
     Write-Host "~ you are runnning on powershell $psversion ~"
     Write-Host ""
     Write-Host "1: Press '1' for Network troubleshooting." -ForegroundColor Magenta
     Write-Host "2: Press '2' for System information." -ForegroundColor Cyan
     Write-Host "3: Press '3' for IT Tools." -ForegroundColor DarkYellow
     Write-Host "e: Press 'e' to end program." -ForegroundColor Red
}
function Network-Menu
{
     param (
           [string]$Title = 'Network Troubleshooting'
     )
     cls
     Write-Host "================ $Title ================" -ForegroundColor green
     
     Write-Host "1: Press '1' for Current network configuration" -ForegroundColor Magenta
     Write-Host "2: Press '2' to test Internet connect." -ForegroundColor Cyan
     Write-Host "3: Press '3' for Ping Range" -ForegroundColor DarkYellow
     Write-Host "4: Press '4' for Traceroute" -ForegroundColor Magenta
     Write-Host "5: Press '5' to test LAN speed. [NOT WORKING]" -ForegroundColor Cyan
     Write-Host "Q: Press 'Q' to quit." -ForegroundColor Red
}
function Information-Menu
{
     param (
           [string]$Title = 'System Information'
     )
     cls
     Write-Host "================ $Title ================" -ForegroundColor green
     
     Write-Host "1: Press '1' for Basic System info." -ForegroundColor Magenta
     Write-Host "2: Press '2' for Hardware info." -ForegroundColor Cyan
     Write-Host "3: Press '3' for this option." -ForegroundColor DarkYellow
     Write-Host "Q: Press 'q' to quit." -ForegroundColor Red
}
function Tools-Menu
{
     param (
           [string]$Title = 'IT Tools'
     )
     cls
     Write-Host "================ $Title ================" -ForegroundColor green
     
     Write-Host "1: Press '1' to Install .msi remotely." -ForegroundColor Magenta
     Write-Host "2: Press '2' to check for expired users." -ForegroundColor Cyan
     Write-Host "3: Press '3' for checking Autoruns" -ForegroundColor DarkYellow
     Write-Host "4: Press '4' to check processes." -ForegroundColor Magenta
     Write-Host "5: Press '5' to check Lockout Status." -ForegroundColor Cyan
     Write-Host "6: Press '6' for Making Windows 10 faster with my tweaker! [NOT WORKING]" -ForegroundColor DarkYellow
     Write-Host "7: Press '7' to fix psexec service. [NOT WORKING]" -ForegroundColor Magenta
     Write-Host "Q: Press 'q' to quit." -ForegroundColor Red
}
<#------------------------------------------- End Declared Functions -----------------------------------------------------------------------#>
Write-Host "The script will not continue until you accept the pop-up window."
$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("
Author: Jeff Czebiniak
Year:2017
Built on Windows 10

NOTE*
These tools need to have Domain Admin/ Local Admins credentials in most cases.

- There will be no changelog or professional licensing, etc.
- I am just an IT guy trying to make all other ITs lives easier as well. I coded all the PS1s and the BATs. All other software is free to use and provided by Microsoft, or Netwrix, or Microsoft approved sources.
- Do not ask me for updated code. If something doesn't work.. Don't use it. Or fix it yourself. Everything will be tested from what I perceive to be the 'Standard setup'
- Also, stuff may be horribly coded, or misspelled. I am not primarily a code writer, this is a 'hobby'. I do what works, and then slim it down. I don't know Powershell in and out, nor do I know cmd, or any of that professionally. This is a courtesy disc, please, by all means, take it, and make it better.

I highly reccomend that this disc be copied to the C:\ drive so that you can implement the logs folder. But, I will design this to work straight off the disc anyway.

Enjoy!
")
Clear-Host
<#PROGRAM START#>
powershell -noprofile $location\PreFlightCheck.ps1
$input = 0
do
{
                Show-SKill
                $input = Read-Host "Please make a selection"
                 if ($input -eq 1){$Skill="Expert"}
                 elseif($input -eq 2){$Skill="Pro"}
                 elseif($input -eq 3){$Skill="Average"}
                 elseif($input -eq 4){$Skill="Dummy"}
                 elseif($input -eq 5){$Skill="Army"}
                 elseif($input -eq 5){$Skill="Army"}
                 elseif($input -eq 'czebiniak'){$Skill="Czebiniak"}
                }
                while ($input -eq 0)
Clear-Host
if ($Skill -eq "Czebiniak"){Write-Host "Welcome, Czebiniak! I have been waiting for you. :)"
}
elseif($Skill -eq "Army"){Write-host "Making program retard-proof..."}
else{Write-Host "You have chosen $Skill. Good job."}
pause
$input = 0
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
                'Welcome to the Network Troubleshooter!'
                do
                {
                Network-Menu
                $input = Read-Host "Please make a selection"
                 if ($input -eq 1){Clear-host
                 & ($location + "\NetInfo.ps1")
                 pause}
                 elseif($input -eq 2){& ($location + "\TestInternet.ps1")}
                 elseif($input -eq 3){& ($location + "\Test_Connection.ps1")}
                 elseif($input -eq 4){& ($location + "\Traceroute.ps1")}
                 elseif($input -eq 5){& ($location + "\SpeedTest.ps1")}
                 elseif($input -eq 'e'){Quit}
                }
                until ($input -eq 'q') 
           } '2' {
                cls
                'Welcome to System Information Gathering!'
                do
                {
                Information-Menu
                $input = Read-Host "Please make a selection"
                if ($input -eq 1){& ($location + "\SysInfo.ps1")}
                 elseif($input -eq 2){& ($location + "\HardwareInfo.ps1")}
                 elseif($input -eq 3){& ($location + "\.ps1")}
                 elseif($input -eq 'e'){Quit}
                }
                until ($input -eq 'q')
           } '3' {
                cls
                'Welcome to IT tools'
                do
                {
                Tools-Menu
                $input = Read-Host "Please make a selection"
                if ($input -eq 1){& ($location + "\InstallMSIremotely.ps1")}
                 elseif($input -eq 2){& ($location + "\check_for_expired_users.ps1")}
                 elseif($input -eq 3){& ($location + "..\..\Sysinternals\Autoruns64.exe")}
                 elseif($input -eq 4){& ($location + "..\..\Sysinternals\procexp64.exe")}
                 elseif($input -eq 5){& ($location + "..\..\LockoutTools\LockoutStatus.exe")}
                 elseif($input -eq 6){& ($location + "\tweaker.ps1")}
                 elseif($input -eq 7){& ($location + "\fixPSEXEC_SVC.ps1")}
                 elseif($input -eq 'e'){Quit}
                }
                until ($input -eq 'q')
           } 'q' {
                'Quitting...'
           }
     }
}
until ($input -eq 'e')
<#PROGRAM QUIT#>
Quit