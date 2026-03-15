## Start by assigning variables in SharePoint as follows:

$AdminURL = "https://contoso-admin.sharepoint.com"

$AdminName = "admin@contoso.onmicrosoft.com"

$SiteCollectionURL = "https://contoso.sharepoint.com/sites/marketing"

$SiteCollectionAdmin = "Mark@sharegate.onmicrosoft.com"

## Connect to SharePoint Online using modern authentication (MFA supported)

Connect-SPOService -Url $AdminURL

## Finally, add the site collection admin, and you're done!

Set-SPOUser -site $SiteCollectionURL -LoginName $SiteCollectionAdmin -IsSiteCollectionAdmin $True
