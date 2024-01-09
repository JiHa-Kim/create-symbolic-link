# PowerShell Script for Creating Symbolic Links

This is a PowerShell script that creates symbolic links for all files with a specific extension from a source directory to a destination directory.

## Description

The script recursively searches for all files with a specific extension in the source directory and its subdirectories. For each file, it creates a symbolic link in the destination directory. If a symbolic link already exists, it skips the file and moves on to the next one.

## License
This repository uses the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0).

## Parameters

The script accepts three optional parameters:
- `source`: The source directory where the files are located. If not provided, it defaults to `"C:\default\source\path"`.
- `destination`: The destination directory where the symbolic links will be created. If not provided, it defaults to `"C:\default\destination\path"`.
- `extension`: The file extension to look for. If not provided, it defaults to `".gguf"`.

## Usage

To run the script with custom source and destination directories and a custom file extension, use the following command:

```powershell
.\YourScript.ps1 -source "C:\your\source\path" -destination "C:\your\destination\path" -extension ".yourExtension"
```
Replace YourScript.ps1 with the actual name of your script. Replace "C:\your\source\path" and "C:\your\destination\path" with your actual source and destination directories. Replace ".yourExtension" with your actual file extension.

If you run the script without providing these parameters, it will use the default paths and file extension.
