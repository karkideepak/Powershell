# Connect to Microsoft Graph with necessary permissions

Connect-MgGraph -Scopes "Team.Create","Group.ReadWrite.All","Directory.ReadWrite.All"

# Define source team ID and new team properties

$sourceTeamId = "<SOURCE_TEAM_ID>"

$body = @{

    displayName    = "New Team Copy"

    description    = "Cloned team from existing team"

    mailNickname   = "newteamcopy$(Get-Random)"

    visibility     = "Private"  # or "Public"

    partsToClone   = "apps,tabs,settings,channels,members"

}

# Clone the team (structure, channels, members, apps, settings)

Copy-MgTeam -TeamId $sourceTeamId -BodyParameter $body

Write-Host "Clone initiated for team ID $sourceTeamId"
