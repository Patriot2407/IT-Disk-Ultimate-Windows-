clear-host
$Admin = Read-Host -Prompt "Admin account login (DOMAIN\User) "
write-host ""
function ConvertFrom-SecureToPlain {
    
    param( [Parameter(Mandatory=$true)][System.Security.SecureString] $SecurePassword)
    
    # Create a "password pointer"
    $PasswordPointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
    
    # Get the plain text version of the password
    $PlainTextPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto($PasswordPointer)
    
    # Free the pointer
    [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($PasswordPointer)
    
    # Return the plain text password
    $PlainTextPassword
    
}
try
{
$SecretPassword = Read-host -Prompt "Enter password" -AsSecureString
write-host ""
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
$TargetComputer = Read-Host -Prompt "Target Computer "
write-host ""
$msiLocation = Read-Host -Prompt ".msi location (FULL path) "
write-host ""
$Password = ConvertFrom-SecureToPlain $SecretPassword
<#Write-Host "$Password is the converted password"#>
try
{
psexec \\$TargetComputer -h -u "$Admin" -p "$Password" cmd /c "msiexec.exe /i "$msiLocation" /quiet /norestart"
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
Write-Host ""
$Exit = Read-host -Prompt "Press ENTER to exit"
write-host ""
exit