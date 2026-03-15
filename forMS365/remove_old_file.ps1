$path = “C:\YourDirectory”
Get-ChildItem $path | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item

# Get-ChildItem retrieves all files.
# Where-Object filters files based on the last write time.
# Remove-Item deletes the files that meet the condition.
