Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

$wallpapersPath = [System.IO.Path]::Combine($env:USERPROFILE, 'Desktop', 'wallpapers')
if (-Not (Test-Path $wallpapersPath)) {
    New-Item -Path $wallpapersPath -ItemType Directory
}

$global:imagePath = ""

function Download-Wallpaper {
    $response = Invoke-RestMethod -Uri 'https://wallhaven.cc/api/v1/search?sorting=toplist&resolutions=1920x1080'
    $randomWallpaper = Get-Random -InputObject $response.data

    $imageUrl = $randomWallpaper.path
    $global:imagePath = Join-Path -Path $wallpapersPath -ChildPath ('wallpaper_' + $randomWallpaper.id + '.jpg')
    Invoke-WebRequest -Uri $imageUrl -OutFile $global:imagePath

    # Write-Host "Wallpaper descargado y guardado en $global:imagePath"
}

Download-Wallpaper

# Configurar la imagen como fondo de escritorio
$fWinIni = 0x01 -bor 0x02
[Wallpaper]::SystemParametersInfo(0x0014, 0, $global:imagePath, $fWinIni) > $null
