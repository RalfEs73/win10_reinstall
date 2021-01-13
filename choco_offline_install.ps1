$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

Write-Host "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install chocolatey-core.extension -y
choco feature enable --name=allowGlobalConfirmation
Write-Host "Done"

Write-Host "Installing Chocolatey GUI"
choco install ChocolateyGUI -y
Write-Host "Done"


#Sample
Write-Host "Installing filminfo.0.6.1.3.nupkg"
Start-BitsTransfer -Source "https://github.com/RalfEs73/chocolatey-packages/raw/master/filminfo/filminfo.0.6.1.3.nupkg" -Destination filminfo.0.6.1.3.nupkg
choco install filminfo -s .
del filminfo.0.6.1.3.nupkg
Write-Host "Done"
