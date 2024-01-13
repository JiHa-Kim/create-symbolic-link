param (
    # Get the source folder
    [string]$source = "C:\default\source\path",

    # Get the destination folder
    [string]$destination = "C:\default\destination\path",

    # Get the file extension
    [string]$extension = "*.gguf"
)

# Get all the symbolic links in the destination folder
$links = Get-ChildItem -Path $destination -Recurse | Where-Object { $_.Attributes -match 'ReparsePoint' }

# Loop through each link
foreach ($link in $links) {
    # Check if the link is deprecated
    if (!(Test-Path -Path $link.Target)) {
        # Remove the deprecated link
        Remove-Item -Path $link.FullName -Force

        # Write a message to indicate the link removal
        Write-Host "Removed deprecated symbolic link for $($link.Name)."
    }
}

# Get all the files with the specified extension in the source folder and its subfolders
$files = Get-ChildItem -Path $source -Filter $extension -Recurse

# Loop through each file
foreach ($file in $files) {
    # Get the name of the file
    $fileName = $file.Name

    # Get the full path of the file
    $filePath = $file.FullName

    # Get the full path of the symbolic link to be created
    $linkPath = Join-Path -Path $destination -ChildPath $fileName

    # Check if the symbolic link already exists
    if (Test-Path -Path $linkPath) {
        # Skip the file if the link already exists
        Write-Host "Skipping $fileName because the link already exists."
    }
    else {
        # Create the symbolic link
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $filePath -Force

        # Write a message to indicate the link creation
        Write-Host "Created symbolic link for $fileName."
    }
}
