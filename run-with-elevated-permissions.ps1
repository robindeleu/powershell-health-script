function Run-Elevated {
    Start-Process PowerShell -ArgumentList "-NoExit -c cd '$pwd'" -Verb RunAs
}    