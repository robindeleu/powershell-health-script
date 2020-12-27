function CPU-Usage {
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                Checking 'CPU Usage WORKING'"
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green
    # Here we make a variabele that get's the CPU in %
    $Processor = (Get-WmiObject -Class win32_processor| Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average
    # Here we print it in the console
    $output = "Live processor ussage: $Processor%"
    # Write-Output $output
    # Here we make a variabele and print in condole the top 10 intensive processes for the CPU
    $processescpu = Get-Counter -ErrorAction SilentlyContinue '\Process(*)\% Processor Time' | Select-Object -ExpandProperty countersamples| Select-Object -Property instancename, cookedvalue| ? {$_.instanceName -notmatch "^(idle|_total|system)$"} | Sort-Object -Property cookedvalue -Descending| Select-Object -First 10| ft InstanceName,@{L='CPU';E={($_.Cookedvalue/100/$env:NUMBER_OF_PROCESSORS).toString('P')}} -AutoSize | Out-String
    Write-Host($processescpu)
    return $output
}