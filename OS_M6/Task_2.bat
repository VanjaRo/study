::2.1
net share NetTemp=%~dp0temp
net use * \\%computername%\NetTemp

::2.2
forfiles /P "C:\Windows" /C "cmd /c if @fsize GEQ 2097152 copy @path \\%computername%\NetTemp /Z"

::2.3
SCHTASKS /Create /SC MINUTE /TN Copier /TR "%~dp0copier.bat"

::2.4
SCHTASKS /Delete /TN Copier

::2.6
forfiles /P "C:\Windows" /C "cmd /c if @fsize GEQ 2097152 copy @path \\%computername%\NetTemp /Z"