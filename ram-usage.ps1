function RAM-Usage {
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                Checking 'RAM Usage WORKING'"
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green

    # Gets instances of Windows Management Instrumentation (WMI) classes.
    $ComputerMemory = Get-WmiObject -Class win32_operatingsystem
    #Here we calculate the % used memory
    $Memory = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize)
    # Here we round the memory to 2 decimals
    $RoundMemory = [math]::Round($Memory, 2)
    # Here we print out the % used RAM
    Write-Output "Live RAM-Usage: $RoundMemory%"
    # To give the a table of top 10 most used RAM processes
    Write-Host(Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 15| Format-Table `
    @{Label = "Used Memory(Mb)"; Expression = {[int]($_.WS / 1Mb)}},
    ProcessName -AutoSize | Out-String)
}