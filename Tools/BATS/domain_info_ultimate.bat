REM ***********************
REM by Jeff Czebiniak
REM ***********************

@echo off && cls

REM where you want to save the txt file **CANNOT be a network locatioN! (IE \\FILESERVER\)
set location=c:\logs\pcinfo
REM where pstools is
set pslocation=\Tools\PSTools

cd %location%
copy NUL > "pc_info_-%date:~10,4%-%date:~7,2%-%date:~4,2%.txt"
cd %pslocation%
psinfo \\* > %location%\pc_info_-%date:~10,4%-%date:~7,2%-%date:~4,2%.txt
pause >nul
msg * "PC Lookup complete!"
exit
exit
exit