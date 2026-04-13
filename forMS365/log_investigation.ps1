# --- Configuration ---
$LogPath = "C:\Path\To\Your\Application.log"
$Keywords = @("error", "fail", "critical", "exception")
$MinutesBack = 60 # Look at the last hour

# --- Check if File Exists ---
if (-not (Test-Path $LogPath)) {
    Write-Error "Log file not found: $LogPath"
    return
}

Write-Host "Investigating log: $LogPath" -ForegroundColor Cyan
$ThresholdDate = (Get-Date).AddMinutes(-$MinutesBack)

# --- Perform Investigation ---
# 1. Read and filter logs by time and keywords
$FilteredLogs = Get-Content -Path $LogPath | Where-Object {
    # Check if line matches keywords (case-insensitive)
    $_ -match ($Keywords -join '|')
}

# 2. Extract specific errors (if logs have timestamps, this requires parsing)
# For this example, we assume basic text logs.
$ErrorCount = $FilteredLogs.Count

Write-Host "Found $ErrorCount matching entries in the last $MinutesBack minutes." -ForegroundColor Yellow

# 3. Output filtered logs to console or a new file
if ($ErrorCount -gt 0) {
    $FilteredLogs | Select-Object -Last 20 # Display last 20 errors
    
    # Optional: Export findings
    # $FilteredLogs | Out-File "C:\Path\To\Findings.log"
}
