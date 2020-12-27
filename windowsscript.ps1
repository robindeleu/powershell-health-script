. .\cpu-usage.ps1
. .\ram-usage.ps1
. .\disk-usage.ps1
. .\installed-programs.ps1
. .\live-processes.ps1
. .\show-event-logs.ps1
. .\show-installed-programs.ps1
. .\users.ps1
. .\run-with-elevated-permissions.ps1
. .\shares.ps1
. .\services.ps1
. .\compareTXT.ps1

function Show-Menu {
    param (
        [string]$Title = 'Powershell health check'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Healthcheck (full) with HTML output"
    Write-Host "2: Check CPU-usage"
    Write-Host "3: Check RAM-usage"
    Write-Host "4: Check Disk-usage"
    Write-Host "5: Show Event Logs"
    Write-Host "6: Show Installed Programs"
    Write-Host "7: Show Live Processes"
    Write-Host "8: Show Users"
    Write-Host "9: Show Shares"
    Write-Host "10: Show Services"
    Write-Host "11: Open current directory with elevated permissions"
    Write-Host "Q: Quit"
}

do{
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
        '1' {
            $title = "Server Health Check"
            $cpu = CPU-Usage
            $ram = RAM-Usage
            $disks = Disk-Usage
            $installedprogs = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | select DisplayName, Publisher, InstallDate | ConvertTo-Html
            $services =  Get-Service | select Name, Status | ConvertTo-Html
            $proces = Get-Process | select Name, Path, Company, CPU | Sort-Object -Property CPU -Descending | Select-Object -First 10 | ConvertTo-Html
            $users = Get-LocalUser | ConvertTo-Html -Property Name, Fullname, LastLogon, PasswordLastSet
            $shares = Get-SmbShare | ConvertTo-Html -Property Name, Path, Description

            $head =     "<title>$title</title>
                        <style>
                        body { font-family: arial; text-align: left; }
                        table { width: 60%; }
                        div { background-color: lightblue; width: 60%; }
                        </style>"

            $htmlpage = "<h1 style='font-family: arial;'>$title</h1>
                        <table style='font-family: arial; text-align: left; width: 60%;'>
                            <tr style='background-color: lightblue;'>
                                <th>CPU Usage</th>
                                <th>RAM Usage</th>
                            </tr>
                            <tr>
                                <td>$cpu</td>
                                <td>$ram</td>
                            </tr>
                        </table>

                        <div><h3>Installed disks and usage</h3></div>
                        <p>$disks</p>

                        <div><h3>Current users</h3></div>
                        <p>$users</p>

                        <div><h3>Shares</h3></div>
                        <p>$shares</p>

                        <div><h3>10 most CPU intensive processes</h3></div>
                        <p>$proces</p>

                        <div><h3>Installed programs</h3></div>
                        <p>$installedprogs</p>

                        <div><h3>Services</h3></div>
                        <p>$services</p>
                        "
            ConvertTo-Html -Head $head -Body $htmlpage -Title "$title" | Out-File healthcheck.html | Start-Process "healthcheck.html"
            
        }
        '2' {
            CPU-Usage
        } 
        '3' {
            RAM-Usage
        } 
        '4' {
            Disk-Usage
        }
        '5' {
            Show-Event-Logs
        }
        '6' {
            Installed-Programs
        }
        '7' {
            Live-Processes
        }
        '8' {
            Users
        }
        '9' {
            Shares
        }
        '10' {
            Show-Services
        }
        '11'{
            Run-Elevated
        }
        '12'{
            CompareTXT -textBefore "./serverlogs/after/shares-11-11-2020-1.txt" -textAfter "./serverlogs/after/shares-11-11-2020-2.txt"
        }
    }
 cmd /c pause
}
until ($selection -eq 'q')
