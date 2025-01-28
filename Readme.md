# FileHashCalculator

## Overview
FileHashCalculator is a PowerShell script that calculates the SHA1, SHA256, and MD5 hashes of a specified file. It outputs only the 'Algorithm' and 'Hash' columns for clarity.

## Usage
1. **Clone the repository**:
    ```sh
    git clone ttps://github.com/karkideepak/Powershell.git
    cd FileHashCalculator
    ```

2. **Edit the script**:
    - Open `GetHashes.ps1` in a text editor.
    - Modify the `$path` parameter to point to the file you want to hash.

3. **Run the script**:
    - Open PowerShell.
    - Navigate to the directory containing `GetHashes.ps1`:
      ```powershell
      cd C:\path\to\FileHashCalculator
      ```
    - Run the script:
      ```powershell
      .\GetHashes.ps1 -path "C:\path\to\your\file.txt"
      ```

## Example
```powershell
.\GetHashes.ps1 -path "C:\path\to\your\file.txt"