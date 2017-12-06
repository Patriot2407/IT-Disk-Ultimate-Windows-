clear-host
$comp = Read-host -Prompt "Computer Name: "
sc \\$comp delete psexesvc
$Exit = Read-host -Prompt "Press ENTER to exit"
exit