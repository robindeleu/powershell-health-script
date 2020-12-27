. .\compareTXT.ps1
function Shares {
    # Here we make some variabeles to use to save the files
    # Fill in the actual date of today here
    $compareDate = "11-11-2020"
    # Fill in the id, 1 is for the first time running, 2 to make the compair object.
    # You must run it 2 times to make that he can compaire
    $saveid="2"
    $logsDirectory = "logs"
    # Here set the path to the reference object
    $referenceopbject = "./$logsDirectory/shares-11-11-2020-1.txt"
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                Checking 'All shares'"
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green
    # Here we make a CMD let to display the share names, paths and description
    $checkshares = Get-SmbShare | Select-Object Name, Path, Description| Format-Table -AutoSize
    $checkshares
    # This part is to save all programs in to a txt file
    $sharesave = "./$logsDirectory/shares-$compareDate-$saveid.txt"
    New-Item -Path $sharesave -ItemType File -Force
    Out-File -inputobject $checkshares -filepath $sharesave -Force
    Write-Host "saved in: $sharesave"
    
    # this part is to compaire with befor and after
    # $output = Compare-Object -ReferenceObject (Get-Content -Path $referenceopbject) -DifferenceObject (Get-Content -Path $sharesave) | Out-String
    # Write-Host $output
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                difference's "
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green

    Write-Host(CompareTXT -textBefore $referenceopbject -textAfter $sharesave| Out-String) 
}