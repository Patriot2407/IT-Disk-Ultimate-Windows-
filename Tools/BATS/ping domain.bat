@echo off 
cls
FOR /L %i IN (1,1,254) DO ping -a -n 1 192.9.200.%i | FIND /i "Reply">>c:\Scripts\ipaddresses.txt
pause