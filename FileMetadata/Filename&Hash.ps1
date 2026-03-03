Get-ChildItem -Recurse -File |
  Get-FileHash |
  Select-Object @{Name='Name';Expression={ Split-Path $_.Path -Leaf }}, Hash, Algorithm
