
# List the filename and hashes of all files in the directory

Get-ChildItem -Recurse -File |
  Get-FileHash |
  Select-Object @{Name='Name';Expression={ Split-Path $_.Path -Leaf }}, Hash, Algorithm
# Split-Path breaks a filesystem path into parts
# -Leaf means “give me the last part only”
