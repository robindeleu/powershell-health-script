. .\compareTXT.ps1
function Installed-Programs {
    # Here we make some variabeles to use to save the files
    # Fill in the actual date of today here
    $compareDate = "11-11-2020"
    # Fill in the id, 1 is for the first time running, 2 to make the compair object.
    # You must run it 2 times to make that he can compaire
    $saveid="2"
    $logsDirectory = "logs"
    # Here set the path to the reference object
    $referenceopbject = "./$logsDirectory/inst-prog-11-11-2020-1.txt"
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                Checking Installed Programs                           "
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green
    # Here we make a variable to display the first 10 programs that are installed
    $console =  Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate -first 10| Format-Table -AutoSize
    $console 
    # Here we make a variablefor all programs that are installed
    $data = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize

    # This part is to save all programs in to a txt file
    $sharesave = "./$logsDirectory/inst-prog-$compareDate-$saveid.txt"
    New-Item -Path $sharesave -ItemType File -Force
    Out-File -inputobject $data -filepath $sharesave -Force
    Write-Host "saved in: $sharesave"
    # This part is to compaire with befor and after
    # Write-Host(Compare-Object -ReferenceObject (Get-Content -Path $referenceopbject) -DifferenceObject (Get-Content -Path $sharesave)|Out-String)
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                difference's "
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green

    Write-Host(CompareTXT -textBefore $referenceopbject -textAfter $sharesave| Out-String) 
}