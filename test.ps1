New-Item -Path "C:\Temp\ChocoCache" -ItemType directory -Force | Out-Null
$cache = "--cacheLocation=C:\Temp\ChocoCache"

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

Install-PackageProvider -Name NuGet -Force
Install-Module -Name BurntToast -Force
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

Write-Host "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install chocolatey-core.extension $cache
choco feature enable --name=allowGlobalConfirmation
choco feature enable -n=useRememberedArgumentsForUpgrades
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
