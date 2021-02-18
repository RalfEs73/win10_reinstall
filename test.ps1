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

# Write-Host "Del Logfiles Test"
foreach ($Log in $Logfiles) {
    If (Test-Path $Log) {
        Write-Host $Log
        Remove-Item $Log
        }
    }

Remove-Item C:\Temp -Recurse

New-BurntToastNotification -Text "Installation abgeschlossen", 'Die Installationen der Anwendungen wurden erfolgreich abgeschlossen'

