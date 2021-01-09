# iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RalfEs73/win10_reinstall/master/win10_reinstall.ps1'))

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

Write-Host "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	choco install chocolatey-core.extension -y
	Write-Host "Done"

Write-Host "Installing Chocolatey GUI"
choco install ChocolateyGUI -y
choco feature enable --name=allowGlobalConfirmation
Write-Host "Done"

Write-Host "Installing Edge (Chromium)"
choco install microsoft-edge -y
del "C:\Users\Public\Desktop\Microsoft Edge.lnk"
Write-Host "Done"

Write-Host "Installing WinRAR"
choco install winrar -y
del "C:\Users\$CurrentUserName\Desktop\PeaZip.lnk"
Write-Host "Done"

Write-Host "Installing GeForce Experience"
choco install geforce-experience -y
Write-Host "Done"

Write-Host "Installing WinSCP"
choco install winscp.install -y
del "C:\Users\Public\Desktop\WinSCP.lnk"
Write-Host "Done"

Write-Host "Installing Notepad++"
choco install notepadplusplus.install -y
Write-Host "Done"

Write-Host "Installing 4K Video Downloader"
choco install 4k-video-downloader -y
del "C:\Users\Public\Desktop\4K Video Downloader.lnk"
Write-Host "Done"

Write-Host "Installing Image Resizer for Windows"
choco install imageresizerapp -y
Write-Host "Done"

Write-Host "Installing VLC"
choco install vlc -y
del "C:\Users\Public\Desktop\VLC media player.lnk"
Write-Host "Done"

Write-Host "Installing Plex"
choco install plex -y
Write-Host "Done"

Write-Host "Installing AnyDVD"
choco install anydvd -y
del "C:\Users\Public\Desktop\AnyDVD.lnk"
Write-Host "Done"

Write-Host "Installing HandBrake"
choco install handbrake.install -y
del "C:\Users\Public\Desktop\Handbrake.lnk"
Write-Host "Done"

Write-Host "Installing GitHub Desktop"
choco install github-desktop -y
del "C:\Users\$CurrentUserName\Desktop\GitHub Desktop.lnk"
Stop-Process -Name GitHubDesktop
Write-Host "Done"

Write-Host "Installing Telegram"
choco install telegram.install -y
del "C:\Users\$CurrentUserName\Desktop\Telegram.lnk"
Write-Host "Done"

Write-Host "Installing WhatsApp"
choco install WhatsApp -y
del "C:\Users\$CurrentUserName\Desktop\WhatsApp.lnk"
Write-Host "Done"

Write-Host "Installing Discord"
choco install discord.install -y
del "C:\Users\$CurrentUserName\Desktop\Discord.lnk"
Write-Host "Done"

Write-Host "Installing Epic Games Launcher"
choco install epicgameslauncher -y
del "C:\Users\Public\Desktop\Epic Games Launcher.lnk"
Write-Host "Done"

Write-Host "Installing Steam"
choco install steam -y
del "C:\Users\Public\Desktop\Steam.lnk"
Write-Host "Done"

Write-Host "Installing Uplay"
choco install uplay -y --ignore-checksums
del "C:\Users\$CurrentUserName\Desktop\Ubisoft Connect.lnk"
Write-Host "Done"

Write-Host "Installing Spotify"
choco install spotify -y --ignore-checksums
del "C:\Users\$CurrentUserName\Desktop\Spotify.lnk"
Write-Host "Done"

Write-Host "Installing Driver Booster"
choco install driverbooster -y --ignore-checksums
del "C:\Users\Public\Desktop\Driver Booster 8.lnk"
Stop-Process -Name Driver*
Write-Host "Done"

Write-Host "Installing Movavi Video Editor Plus"
Start-BitsTransfer -Source "https://github.com/RalfEs73/movavivideoeditorplus_choco/raw/master/movavivideoeditorplus.21.1.0.nupkg" -Destination movavivideoeditorplus.21.1.0.nupkg
choco install movavivideoeditorplus -s .
del "C:\Users\$CurrentUserName\Desktop\Movavi Video Editor Plus 2021.lnk"
del movavivideoeditorplus.21.1.0.nupkg
Write-Host "Done"

Write-Host "Installing Film Info! Organiser"
Start-BitsTransfer -Source "https://github.com/RalfEs73/filminfoorganizer_choco/raw/master/filminfo.0.6.1.3.nupkg" -Destination filminfo.0.6.1.3.nupkg
choco install filminfo -s .
del "C:\Users\Public\Desktop\Film Info! Organizer.lnk"
mkdir "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/filminfoorganizer_choco/master/settings/Columns.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Columns.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/filminfoorganizer_choco/master/settings/Config.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Config.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/filminfoorganizer_choco/master/settings/Favoriten.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Favoriten.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/filminfoorganizer_choco/master/settings/Filter.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Filter.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/filminfoorganizer_choco/master/settings/Genre.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Genre.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/filminfoorganizer_choco/master/settings/Interface.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\Interface.xml"
Start-BitsTransfer -Source "https://raw.githubusercontent.com/RalfEs73/filminfoorganizer_choco/master/settings/tmdb_config.xml" -Destination "C:\Users\$CurrentUserName\AppData\Roaming\film info! organizer\tmdb_config.xml"
del filminfo.0.6.1.3.nupkg
Write-Host "Done"


$Bloatware = @(
        #"Microsoft.3DBuilder"
        #"Microsoft.Microsoft3DViewer"
        #"Microsoft.MicrosoftSolitaireCollection"
        #"Microsoft.NetworkSpeedTest"
        #"Microsoft.Print3D"
        #"Microsoft.SkypeApp"
        #"Microsoft.ZuneMusic"
        #"Microsoft.ZuneVideo"
        "CandyCrush"
		)
    
	foreach ($Bloat in $Bloatware) {
        Get-AppxPackage -Name $Bloat| Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        Write-Host "Deinstalliere: $Bloat."
    }
