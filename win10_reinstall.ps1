# iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RalfEs73/win10_reinstall/master/win10_reinstall.ps1'))

New-Item -Path "C:\Temp\ChocoCache" -ItemType directory -Force | Out-Null
$cache = "--cacheLocation=C:\Temp\ChocoCache"

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

Install-PackageProvider -Name NuGet -Force
Install-Module -Name BurntToast -Force
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

Write-Host "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install chocolatey-core.extension -y $cache
choco feature enable --name=allowGlobalConfirmation
choco feature enable -n=useRememberedArgumentsForUpgrades
Write-Host "Done"

Write-Host "Installing Chocolatey GUI"
choco install ChocolateyGUI -y $cache
Write-Host "Done"

Write-Host "Installing Edge (Chromium)"
choco install microsoft-edge -y $cache
Remove-Item "C:\Users\Public\Desktop\Microsoft Edge.lnk"
Write-Host "Done"

Write-Host "Installing WinRAR"
choco install winrar -y $cache
Write-Host "Done"

Write-Host "Installing gsudo"
choco install gsudo -y $cache
Write-Host "Done"

Write-Host "Installing ChocoUpdateNotifier"
choco install choco install choco-update-notifier -y $cache
Write-Host "Done"

Write-Host "Installing Windows Termial"
choco install microsoft-windows-terminal
New-Item -Path "C:\Users\$CurrentUserName\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -ItemType directory -Force | Out-Null
Start-BitsTransfer -Source "https://github.com/RalfEs73/win10_reinstall/raw/master/Config%20Files/Windows%20Terminal/settings.json" -Destination "C:\Users\$CurrentUserName\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Write-Host "Done"

Write-Host "Installing GeForce Experience"
choco install geforce-experience -y $cache
Write-Host "Done"

Write-Host "Installing WinSCP"
choco install winscp.install -y $cache
Remove-Item "C:\Users\Public\Desktop\WinSCP.lnk"
Write-Host "Done"

Write-Host "Installing Notepad++"
choco install notepadplusplus.install -y $cache
Write-Host "Done"

Write-Host "Installing 4K Video Downloader"
choco install 4k-video-downloader -y $cache
Remove-Item "C:\Users\Public\Desktop\4K Video Downloader.lnk"
Write-Host "Done"

Write-Host "Installing Image Resizer for Windows"
choco install imageresizerapp -y $cache
Write-Host "Done"

Write-Host "Installing VLC"
choco install vlc -y $cache
Remove-Item "C:\Users\Public\Desktop\VLC media player.lnk"
Write-Host "Done"

Write-Host "Installing Plex"
choco install plex -y $cache
Write-Host "Done"

Write-Host "Installing AnyDVD"
choco install anydvd -y $cache
Remove-Item "C:\Users\Public\Desktop\AnyDVD.lnk"
Write-Host "Done"

Write-Host "Installing AnyStream"
choco install anystream --version=1.0.7.0 -y $cache
Remove-Item "C:\Users\Public\Desktop\AnyStream.lnk"
Write-Host "Done"

Write-Host "Installing File Converter"
choco install file-converter -y $cache
Write-Host "Done"

Write-Host "Installing HandBrake"
choco install handbrake.install -y $cache
Remove-Item "C:\Users\Public\Desktop\Handbrake.lnk"
Write-Host "Done"

Write-Host "Installing GitHub Desktop"
choco install github-desktop -y $cache
Remove-Item "C:\Users\$CurrentUserName\Desktop\GitHub Desktop.lnk"
Stop-Process -Name GitHubDesktop
Write-Host "Done"

Write-Host "Installing Telegram"
choco install telegram.install -y $cache
Remove-Item "C:\Users\$CurrentUserName\Desktop\Telegram.lnk"
Write-Host "Done"

Write-Host "Installing WhatsApp"
choco install WhatsApp -y $cache
Remove-Item "C:\Users\$CurrentUserName\Desktop\WhatsApp.lnk"
Write-Host "Done"

Write-Host "Installing Discord"
choco install discord.install -y $cache
Remove-Item "C:\Users\$CurrentUserName\Desktop\Discord.lnk"
Write-Host "Done"

Write-Host "Installing Gitter"
choco install gitter -y $cache
Write-Host "Done"

Write-Host "Installing Epic Games Launcher"
choco install epicgameslauncher -y $cache
Remove-Item "C:\Users\Public\Desktop\Epic Games Launcher.lnk"
Write-Host "Done"

Write-Host "Installing Steam"
choco install steam -y $cache
Remove-Item "C:\Users\Public\Desktop\Steam.lnk"
Write-Host "Done"

Write-Host "Installing Uplay"
choco install uplay -y $cache --ignore-checksums
Remove-Item "C:\Users\$CurrentUserName\Desktop\Ubisoft Connect.lnk"
Write-Host "Done"

Write-Host "Installing Amazon Games"
# Not listed yet
choco install amazongames --version=1.7.172.1 $cache
Remove-Item "C:\Users\$CurrentUserName\Desktop\Amazon Games.lnk"
Stop-Process -Name Amazon*
Write-Host "Done"

Write-Host "Installing Streamlabs OBS"
choco install streamlabs-obs -y $cache
Remove-Item "C:\Users\Public\Desktop\Streamlabs OBS.lnk"
Write-Host "Done"

Write-Host "Installing Spotify"
choco install spotify -y $cache --ignore-checksums
Remove-Item "C:\Users\$CurrentUserName\Desktop\Spotify.lnk"
Write-Host "Done"

Write-Host "Installing Driver Booster"
choco install driverbooster -y $cache --ignore-checksums
Remove-Item "C:\Users\Public\Desktop\Driver Booster 8.lnk"
Stop-Process -Name Driver*
Write-Host "Done"

Write-Host "Installing Exodus Wallet"
# Not listed yet
choco install exoduswallet --version=21.2.12 -y $cache
Remove-Item "C:\Users\$CurrentUserName\Desktop\Exodus.lnk"
Write-Host "Done"

Write-Host "Installing Thumbico"
# Not listed yet
choco install thumbico --version=1.5.0.25 -y $cache
Write-Host "Done"

Write-Host "Installing Movavi Video Editor Plus"
# Not listed yet
choco install movavivideoeditorplus --version=21.1.0 -y $cache
Remove-Item "C:\Users\$CurrentUserName\Desktop\Movavi Video Editor Plus 2021.lnk"
Write-Host "Done"

Write-Host "Installing Film Info! Organiser"
# Not listed yet
choco install filminfo --version=0.6.1.3 -y $cache
Remove-Item "C:\Users\Public\Desktop\Film Info! Organizer.lnk"
New-Item -Path "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer" -ItemType directory -Force | Out-Null
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/chocolatey-packages/master/filminfo/settings/Columns.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Columns.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/chocolatey-packages/master/filminfo/settings/Config.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Config.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/chocolatey-packages/master/filminfo/settings/Favoriten.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Favoriten.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/chocolatey-packages/master/filminfo/settings/Filter.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Filter.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/chocolatey-packages/master/filminfo/settings/Genre.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Genre.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/chocolatey-packages/master/filminfo/settings/Interface.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Interface.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/chocolatey-packages/master/filminfo/settings/tmdb_config.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\tmdb_config.xml"
Write-Host "Done"

Write-Host "Aktiviere Windows Sandbox"
$test=(Get-WindowsOptionalFeature -Featurename "Containers-DisposableClientVM" -Online)
if (!$test) {
	Write-Host " ** Unsupported Operating System: Windows 10 Pro or Enterprise 1903 or greater required." -Foreground Magenta
	return
	} else {
	Enable-WindowsOptionalFeature -Online -FeatureName Containers-DisposableClientVM -NoRestart
	}
Write-Host "Done"

Write-Host "Registry changes"
# Verbesserung der Microsoft Qualität in der Games Bar
New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR' -Name  'EchoCancellationEnabled' -Value '0' -PropertyType 'DWORD' –Force

Write-Host "Deinstalliere Bloatware"
$Bloatware = @(
        "CandyCrush"
		)
    
foreach ($Bloat in $Bloatware) {
        Get-AppxPackage -Name $Bloat| Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        Write-Host "Deinstalliere: $Bloat."
    }

$Logfiles = @(
    "C:\ProgramData\chocolatey\logs\chocolatey.log"
    "C:\ProgramData\chocolatey\logs\choco.summary.log"
    )

Write-Host "Del Logfiles"
foreach ($Log in $Logfiles) {
    If (Test-Path $Log) {
        Write-Host $Log
        Remove-Item $Log
        }
    }
Remove-Item C:\Temp -Recurse

New-BurntToastNotification -Text "Installation abgeschlossen", 'Die Installationen der Anwendungen wurden erfolgreich abgeschlossen'
