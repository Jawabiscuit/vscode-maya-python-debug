# Python paths
Set-Item "env:\PYTHONPATH" ((Get-Location).Path + ";$env:PYTHONPATH")
