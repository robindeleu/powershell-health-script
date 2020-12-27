Write-Host "`n------------------------------------------------------" -ForegroundColor Green
Write-Host "                Checking 'CPU Usage WORKING'"
Write-Host "------------------------------------------------------`n" -ForegroundColor Green
$Processor = (Get-WmiObject -Class win32_processor| Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average
Write-Output $Processor
Write-Host "`n------------------------------------------------------" -ForegroundColor Green
Write-Host "                Checking 'RAM Usage WORKING'"
Write-Host "------------------------------------------------------`n" -ForegroundColor Green
$ComputerMemory = Get-WmiObject -Class win32_operatingsystem
$Memory = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize)
$RoundMemory = [math]::Round($Memory, 2)
Write-Output $RoundMemory
Write-Host "`n------------------------------------------------------" -ForegroundColor Green
Write-Host "                Checking 'Disk Usage WORKING'"
Write-Host "------------------------------------------------------`n" -ForegroundColor Green
$TCapacity =@{  Expression = { "{0,19:n2}" -f ($_.Capacity / 1GB) };
                Name= 'Total Capacity (GB)';}
$Freespace =@{  Expression = { "{0,15:n2}" -f ($_.FreeSpace / 1GB) };
                Name = 'Free Space (GB)';
}
$PercentFree =@{Expression = { [int]($_.Freespace * 100 / $_.Capacity) };
                Name = 'Free (%)'
}
Get-WmiObject -namespace "root/cimv2" -query "SELECT Name, Capacity, FreeSpace FROM Win32_Volume WHERE Capacity > 0 and (DriveType = 2 OR DriveType = 3)" |
Select-Object -Property Name, $TCapacity, $Freespace, $PercentFree  | Sort-Object 'Free (%)' -Descending
Write-Host "`n------------------------------------------------------" -ForegroundColor Green
Write-Host "                Checking 'All installed programs working'"
Write-Host "------------------------------------------------------`n" -ForegroundColor Green
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize
Write-Host "`n------------------------------------------------------" -ForegroundColor Green
Write-Host "                Checking 'All live processes working'"
Write-Host "------------------------------------------------------`n" -ForegroundColor Green
$A = Get-Process
$A | Get-Process | Format-Table -View priority

cmd /c pause
