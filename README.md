<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![LinkedIn][linkedin-shield]][linkedin-url]

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=ralfes&url=https://github.com/ralfes/Windows10Install&title=Windows10Install&language=&tags=github&category=software) 



# Windows 10 (Re-)Installation Script
Dieses Script installiert die von mir gewünschten Anwendungen auf einem Windows 10 PC.

[![Youtube](https://img.youtube.com/vi/qpW2zixWoRk/0.jpg)](https://www.youtube.com/watch?v=qpW2zixWoRk)


## Aufruf
Mit PowerShell (und Adminrechten) den folgenden Befehl starten:
```sh
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RalfEs73/win10_reinstall_choco/master/win10_reinstall.ps1'))
```

## Die folgenden Anwendungen werden installiert:
* Chocolatey Core
* Chocolatey GUI
* Edge (Chromium)
* WinRAR
* GeForce Experience
* WinSCP
* Notepad++
* 4K Video Downloader
* Image Resizer for Windows
* VLC
* Plex
* AnyDVD
* File Converter
* HandBrake
* GitHub Desktop
* Telegram
* WhatsApp
* Discord
* Epic Games Launcher
* Steam
* Uplay (Ubisoft Connect)
* Streamlabs OBS
* Spotify
* Driver Booster
* Movavi Video Editor Plus
* Film Info! Organiser

## Die folgenden Anwendungen werden deinstalliert:
* CandyCrush App

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/ralfes
