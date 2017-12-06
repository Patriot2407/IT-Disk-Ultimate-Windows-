@echo off && cls
SET curloc=%~dp0
net use _: "%curloc:~0,-1%"
_:
start /wait run.bat
net use /DELETE _: /y
exit