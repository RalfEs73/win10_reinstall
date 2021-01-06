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
Write-Host "Done"

Write-Host "Installing Notepad++"
choco install notepadplusplus.install -y
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