# iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RalfEs73/win10_reinstall/master/win10_reinstall.ps1'))

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

Write-Host "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	choco install chocolatey-core.extension -y
	Write-Host "Done"

Write-Host "Installing Chocolatey GUI"
choco install ChocolateyGUI -y
Write-Host "Done"

Write-Host "Installing WinRAR"
choco install winrar -y
Write-Host "Done"

Write-Host "Installing WinSCP"
choco install winscp.install -y
del C:\Users\Public\Desktop\WinSCP.lnk
Write-Host "Done"

Write-Host "Installing Notepad++"
choco install notepadplusplus.install -y
Write-Host "Done"

Write-Host "Installing GitHub Desktop"
choco install github-desktop -y
del "C:\Users\$CurrentUserName\Desktop\GitHub Desktop.lnk"
Stop-Process -Name GitHubDesktop
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