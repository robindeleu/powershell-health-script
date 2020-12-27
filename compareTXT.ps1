function CompareTXT {
    # Added parameters for comparison
    param (
        [string]$textBefore,
        [string]$textAfter
    )

    # Put the contents of the file in a reference
    $File1 = Get-Content $textBefore | Foreach {$_.TrimEnd()}
    $File2 = Get-Content $textAfter | Foreach {$_.TrimEnd()}

    # Read every line of the textBefore and if it didn't exist output the line
    ForEach ($line in $File2)
    {
        If (!($File1 -contains $line))
        {
            Write-Host $Line
        }
    }
}