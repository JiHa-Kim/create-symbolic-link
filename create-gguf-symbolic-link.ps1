param (
    # Get the source folder
    [string]$source = "C:\default\source\path",

    # Get the destination folder
    [string]$destination = "C:\default\destination\path"
)

# Get all the gguf files in the source folder and its subfolders
$ggufFiles = Get-ChildItem -Path $source -Filter *.gguf -Recurse

# Loop through each gguf file
foreach ($ggufFile in $ggufFiles) {
    # Get the name of the gguf file
    $ggufName = $ggufFile.Name

    # Get the full path of the gguf file
    $ggufPath = $ggufFile.FullName

    # Get the full path of the symbolic link to be created
    $linkPath = Join-Path -Path $destination -ChildPath $ggufName

    # Check if the symbolic link already exists
    if (Test-Path -Path $linkPath) {
        # Skip the file if the link already exists
        Write-Host "Skipping $ggufName because the link already exists."
    }
    else {
        # Create the symbolic link
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $ggufPath -Force

        # Write a message to indicate the link creation
        Write-Host "Created symbolic link for $ggufName."
    }
}
