# Define the path to the file you want to hash
$path = "C:\Users\FlareVM10\Downloads\doc99280003888283722.pdf"

# Calculate the MD5 hash of the file and store the result
$md5 = Get-FileHash -Path $path -Algorithm MD5 | Select-Object Algorithm, Hash

# Calculate the SHA1 hash of the file and store the result
$sha1 = Get-FileHash -Path $path -Algorithm SHA1 | Select-Object Algorithm, Hash

# Calculate the SHA256 hash of the file and store the result
$sha256 = Get-FileHash -Path $path -Algorithm SHA256 | Select-Object Algorithm, Hash

# Display the SHA1 hash
$sha1

# Display the SHA256 hash
$sha256

# Display the MD5 hash
$md5

# Alternatively using loop

# Define the path to the file you want to hash
$path = "C:\Users\FlareVM10\Downloads\doc99280003888283722.pdf"

# Define the list of hashing algorithms you want to use
$algorithms = @('MD5', 'SHA1', 'SHA256')

# Loop through each algorithm, calculate the hash, and display the result
foreach ($algorithm in $algorithms) {
    Get-FileHash -Path $path -Algorithm $algorithm | Select-Object Algorithm, Hash
}