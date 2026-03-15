New-ADUser -Name “John Doe” -GivenName “John” -Surname “Doe” -UserPrincipalName “jdoe@example.com” -Path “OU=Users,DC=example,DC=com” -AccountPassword (ConvertTo-SecureString “P@ssw0rd” -AsPlainText -Force) -Enabled $true

# New-ADUser creates a new Active Directory user.
# You provide necessary attributes like name, email, path, and password.
