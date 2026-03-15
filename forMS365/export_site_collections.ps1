PowerShell lets you export a list of SharePoint site collections and their properties:

# 1. Import the SharePoint Online Management Shell module

Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking

# 2. Set your SharePoint admin center URL

$AdminCenterUrl = "https://<yourtenant>-admin.sharepoint.com"

# 3. Connect to SharePoint Online

Connect-SPOService -Url $AdminCenterUrl

# 4. Retrieve all site collections in the tenant

$AllSites = Get-SPOSite -Limit All -IncludePersonalSite $true

# 5. Select the properties you want to export

#    Adjust or add additional properties as needed

$SiteReport = $AllSites | Select-Object `

    Title, `

    Url, `

    Owner, `

    Template, `

    StorageQuota, `

    StorageUsageCurrent, `

    LastContentModifiedDate, `

    SharingCapability

# 6. Export the report to CSV

$CsvPath = "C:\Temp\SharePointSiteCollections.csv"

$SiteReport | Export-Csv -Path $CsvPath -NoTypeInformation -Encoding UTF8

Write-Host "Export complete. File saved to $CsvPath"
