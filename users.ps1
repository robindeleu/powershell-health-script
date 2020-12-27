. .\compareTXT.ps1
function Users {
    # Added Title
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                Checking Users                           "
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green

    # File names used to store/read
    $fileBefore = "./logs/usersbefore.txt"
    $fileAfter = "./logs/usersafter.txt"
    $fileBackup = "./logs/backupUsers.txt"

    # Output the important data in a nice formatted table and the date
    Get-LocalUser | Sort-Object PrincipalSource | Select Name, PrincipalSource, LastLogon, PasswordChangeableDate, PasswordLastSet, Description | Format-Table -AutoSize
    Get-Date -Format "dddd MM/dd/yyyy HH:mm K`n"

    # Variables that contains the users where the PrincipalSource is equal to a certain source
    $Locals = Get-LocalUser | Where-Object PrincipalSource -eq "Local" | Select PrincipalSource
    $mcAccounts = Get-LocalUser | Where-Object PrincipalSource -eq "MicrosoftAccount" | Select PrincipalSource

    # Count how many users are in the different category's
    Foreach ($item in $Locals){
        $cntLocals ++
    }

    Foreach ($item in $mcAccounts) {
        $cntMCAccounts ++
    }

    # Output the number of accounts in the different category's
    Write-Host "Number of Local accounts: " $cntLocals
    Write-Host "Number of Microsoft accounts: " $cntMCAccounts "`n"

    # Store current data to a text file for comparison
    Get-LocalUser | Sort-Object PrincipalSource | Select Name, PrincipalSource, LastLogon, PasswordChangeableDate, PasswordLastSet, Description > $fileAfter

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
    Get-LocalUser | Sort-Object PrincipalSource | Select Name, PrincipalSource, LastLogon, PasswordChangeableDate, PasswordLastSet, Description > $fileBefore
}