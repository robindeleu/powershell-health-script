function Installed-Programs-working {
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                Checking 'All installed programs working'"
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green
    Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize
}