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


#Sample
Write-Host "Installing Movavi Video Editor Plus"
Start-BitsTransfer -Source "https://github.com/RalfEs73/movavivideoeditorplus_choco/raw/master/movavivideoeditorplus.21.1.0.nupkg" -Destination movavivideoeditorplus.21.1.0.nupkg
choco install movavivideoeditorplus -s .
del movavivideoeditorplus.21.1.0.nupkg
Write-Host "Done"
