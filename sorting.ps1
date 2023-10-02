# Obtener la ruta del escritorio
$desktopPath = [System.Environment]::GetFolderPath('Desktop')

# Ruta de la carpeta "sorting"
$sortingPath = Join-Path -Path $desktopPath -ChildPath 'sorting'

# Crear la carpeta "sorting" si no existe
if (-Not (Test-Path $sortingPath)) {
    New-Item -Path $sortingPath -ItemType Directory
}

# Iterar sobre todos los archivos en el escritorio
Get-ChildItem -Path $desktopPath -File | ForEach-Object {
    $file = $_
    
    # Ignorar archivos con la extensión .iso
    if ($file.Extension -ne '.iso') {
        
        # Crear una carpeta para la extensión del archivo si no existe
        $extensionFolder = Join-Path -Path $sortingPath -ChildPath $file.Extension.TrimStart('.')
        if (-Not (Test-Path $extensionFolder)) {
            New-Item -Path $extensionFolder -ItemType Directory
        }
        
        # Mover el archivo a la carpeta correspondiente
        Move-Item -Path $file.FullName -Destination $extensionFolder
    }
}
