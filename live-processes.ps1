. .\compareTXT.ps1
function Live-Processes {
    # Here we make some variabeles to use to save the files
    # Fill in the actual date of today here
    $compareDate = "11-11-2020"
    # Fill in the id, 1 is for the first time running, 2 to make the compair object.
    # You must run it 2 times to make that he can compaire
    $saveid="2"
    $logsDirectory = "logs"
    # Here set the path to the reference object
    $referenceopbject = "./$logsDirectory/proc-11-11-2020-1.txt"
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                Checking 'All live processes working'"
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green
    $data = Get-Process | select -Property ProcessName
    # This is just a simple CMDLET that makes that we can print out the processes sorted by CPU and display the first 10
    Write-Host(Get-Process | Sort-Object -Property cpu -Descending | Select-Object -First 10| Out-String) 
    $procsave = "./$logsDirectory/proc-$compareDate-$saveid.txt"
    New-Item -Path $procsave -ItemType File -Force
    Out-File -inputobject $data -filepath $procsave -Force
    Write-Host "saved in: $procsave"
    # Write-Host(Compare-Object -ReferenceObject (Get-Content -Path $referenceopbject) -DifferenceObject (Get-Content -Path $procsave)|Out-String)
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                difference's "
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green

    Write-Host(CompareTXT -textBefore $referenceopbject -textAfter $procsave| Out-String) 
}