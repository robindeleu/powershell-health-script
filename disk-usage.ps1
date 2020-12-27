function Disk-Usage {
    Write-Host "`n------------------------------------------------------" -ForegroundColor Green
    Write-Host "                Checking 'Disk Usage WORKING'"
    Write-Host "------------------------------------------------------`n" -ForegroundColor Green
    # Here we make a object for the total capacity
    $TCapacity =@{  Expression = { "{0,19:n2}" -f ($_.Capacity / 1GB) };
                    Name= 'Total Capacity (GB)';}
    # Here we make a object for the Free capacity
    $Freespace =@{  Expression = { "{0,15:n2}" -f ($_.FreeSpace / 1GB) };
                    Name = 'Free Space (GB)';
    }
    # Here we make a object that can calculate the % Free space
    $PercentFree =@{Expression = { [int]($_.Freespace * 100 / $_.Capacity) };
                    Name = 'Free (%)'
    }
    # This part makes that we can print out the table that print out the name, total capacity, free space in GB and %
    # Sort by Free space in percent 
    $data =Get-WmiObject -namespace "root/cimv2" -query "SELECT Name, Capacity, FreeSpace FROM Win32_Volume WHERE Capacity > 0 and (DriveType = 2 OR DriveType = 3)" |
    Select-Object -Property Name, $TCapacity, $Freespace, $PercentFree  | Sort-Object 'Free (%)' -Descending
    Write-Host($data | Out-String)
    $htmldata = $data | ConvertTo-Html -Property Name, "Total Capacity (GB)", "Free Space (GB)"
    return $htmldata 
}