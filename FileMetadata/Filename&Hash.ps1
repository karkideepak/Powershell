# Enumerates all files under the current directory

Get-ChildItem -Recurse -File |
  Get-FileHash |
  Select-Object @{Name='Name';Expression={ Split-Path $_.Path -Leaf }}, Hash, Algorithm
# Split-Path breaks a filesystem path into parts
# -Leaf means
