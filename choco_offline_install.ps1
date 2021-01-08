#Sample

Write-Host "Installing Movavi Video Editor Plus"
Start-BitsTransfer -Source "https://github.com/RalfEs73/movavivideoeditorplus_choco/raw/master/movavivideoeditorplus.21.1.0.nupkg" -Destination movavivideoeditorplus.21.1.0.nupkg
choco install movavivideoeditorplus -s .
del movavivideoeditorplus.21.1.0.nupkg
Write-Host "Done"
