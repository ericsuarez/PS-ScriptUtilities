# Ruta al escritorio del usuario
$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, 'Desktop')

# Obtener todas las carpetas en la ruta del escritorio
$folders = Get-ChildItem -Path $desktopPath -Directory

# Array con los índices de los íconos posibles en SHELL32.dll
$iconIndices = 1..326  # Puedes cambiar este rango según lo que desees

foreach ($folder in $folders) {
    # Ruta completa al archivo desktop.ini dentro de la carpeta
    $desktopIniPath = Join-Path -Path $folder.FullName -ChildPath 'desktop.ini'

    # Elegir un índice de ícono al azar
    $randomIconIndex = Get-Random -InputObject $iconIndices

    # Contenido del archivo desktop.ini
    $content = @"
[.ShellClassInfo]
IconResource=C:\WINDOWS\System32\SHELL32.dll,$randomIconIndex
"@

    # Crear o sobrescribir el archivo desktop.ini
    Set-Content -Path $desktopIniPath -Value $content

    # Ocultar el archivo desktop.ini
    attrib +s +h "$desktopIniPath"

    # Hacer que la carpeta muestre el ícono personalizado
    attrib +s "$($folder.FullName)"

    #Write-Host "Ícono de la carpeta $($folder.Name) cambiado al índice $randomIconIndex."
}
