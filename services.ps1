. .\compareTXT.ps1
function Show-Services {
    # Added Title
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                Checking Services                           "
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green

    # File names used to store/read
    $fileBefore = "./logs/servicesbefore.txt"
    $fileAfter = "./logs/servicesafter.txt"
    $fileBackup = "./logs/backupServices.txt"

    # Output the important data in a nice formatted table and the date
    Get-Service | Sort-Object Status | Format-Table -AutoSize
    Get-Date -Format "dddd MM/dd/yyyy HH:mm K`n"

    # Variables that contains the services where the status is equal
    $runningServices = Get-Service | Where-Object Status -eq "Running" | Select Status
    $stoppedServices = Get-Service | Where-Object Status -eq "Stopped" | Select Status

    # Count how many services are running/stopped
    Foreach ($item in $runningServices){
        $cntRunning ++
    }

    Foreach ($item in $stoppedServices) {
        $cntStopped ++
    }

    # Output the number of accounts in the different category's
    Write-Host "Number of Running Services: " $cntRunning
    Write-Host "Number of Stopped Services: " $cntStopped "`n"

    # Store current data to a text file for comparison
    Get-Service | Sort-Object Status > $fileAfter

    # If the files are the same (no change) then it will show the user "Files are the same" otherwise the opposite
    if(Compare-Object -ReferenceObject (Get-Content $fileBefore) -DifferenceObject (Get-Content $fileAfter)) {
        Write-Host "Files are different"
    }
    else {
        Write-Host  "Files are the same`n"
    }

    # Compare the current data with the previous data, if data is different user sees what the differences are
    CompareTXT -textBefore $fileBefore -textAfter $fileAfter

    # Add previous data to a backupfile along with the date for easy search
    $Date = Get-Date -Format "dddd MM/dd/yyyy HH:mm K"
    $From = Get-Content -Path $fileBefore
    Add-Content -Path $fileBackup -Value $From
    Add-Content -Path $fileBackup -Value $Date
    
    # Store current data as the previous data for future use
    Get-Service | Sort-Object Status > $fileBefore

}