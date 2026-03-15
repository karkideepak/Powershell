# Connect to the source site

Connect-PnPOnline -Url "https://contoso.sharepoint.com/sites/source" -Interactive

# Capture group permissions

$Groups = Get-PnPGroup | ForEach-Object {

    [PSCustomObject]@{

        Name  = $_.Title

        Roles = (Get-PnPGroupPermissions -Identity $_.Title).RoleDefinitionBindings.Name

    }

}

# Connect to the target site

Connect-PnPOnline -Url "https://contoso.sharepoint.com/sites/target" -Interactive

# Break inheritance on the target site

$web = Get-PnPWeb

$web.BreakRoleInheritance($false, $true)

$web.Update()

Invoke-PnPQuery

‍

# Reapply permissions

foreach ($Group in $Groups) {

    if (-not (Get-PnPGroup -Identity $Group.Name -ErrorAction SilentlyContinue)) {

        New-PnPGroup -Title $Group.Name

    }

    Set-PnPGroupPermissions -Identity $Group.Name -AddRole $Group.Roles

}
