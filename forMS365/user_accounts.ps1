# Open the PowerShell console as an administrator.
#Create a new user account with:
New-LocalUser -Name “NewUser” -Password (ConvertTo-SecureString “YourPassword” -AsPlainText -Force) -FullName “New User” -Description “Temporary User Account”

#Add the user to a specific group (e.g., Administrators):
Add-LocalGroupMember -Group “Administrators” -Member “NewUser”

#To remove a user when it’s no longer needed:
Remove-LocalUser -Name “NewUser”
