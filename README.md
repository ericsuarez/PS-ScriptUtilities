# Script Collection Repository

This repository hosts a collection of various scripts intended to automate mundane tasks, troubleshoot issues, and demonstrate coding solutions in PowerShell. Each script is designed for a specific purpose and is well-commented to ensure understanding and ease of use.

## Repository Structure

- Each script is stored in a dedicated folder containing the script file along with its respective README file.
- The README file provides a description of what the script does, how to use it, and any other pertinent information.

## Getting Started

1. Clone the repository to your local machine.
2. Navigate to the script you are interested in.
3. Read the accompanying README file for instructions on how to use the script.
4. Execute the script following the provided instructions.

## Contributing

Feel free to contribute to this repository by creating a pull request. Ensure that your script is placed in a new folder and accompanied by a README file explaining its usage.




# Random Folder Icon Script

This PowerShell script changes the icons of all folders on the user's desktop to random icons from the `SHELL32.dll` file. This is done by creating or updating a `desktop.ini` file in each folder with the icon configuration, and then setting the system and hidden attributes for the `desktop.ini` file and the system attribute for the folder to ensure the custom icon is displayed.

## Usage

1. Make sure you have PowerShell installed on your machine.
2. Copy the script below and save it as `RandomFolderIcon.ps1`.
3. Right-click the saved script file, and run with PowerShell.


# Random Wallpaper Script

This PowerShell script fetches a random wallpaper from the popular wallpaper site wallhaven.cc, saves it to a user-defined directory, and sets it as the desktop wallpaper.

## Usage

1. Make sure you have PowerShell installed on your machine.
2. Copy the script below and save it as `RandomWallpaper.ps1`.
3. Right-click the saved script file, and run with PowerShell.


# PowerShell IP Scanner

This PowerShell script scans a specific subnet to find which IP addresses are online and which are offline.

## Usage

1. Ensure PowerShell is installed on your machine.
2. Copy the script below and save it as `IPScanner.ps1`.
3. Right-click the saved script file, and run with PowerShell.
4. You can modify the `$subnet`, `$startRange`, and `$endRange` variables at the beginning of the script to fit your specific network setup.
