# Obtener la configuración regional actual de Windows
$language = (Get-Culture).Name

# Definir los textos según el idioma
switch -Regex ($language) {
    "^es" {
        $prompt = "Introduce la ruta base donde deseas crear la estructura de carpetas:"
    }
    default {
        $prompt = "Enter the base path where you want to create the folder structure:"
    }
}

# Solicitar al usuario que introduzca la ruta base
$basePath = Read-Host $prompt

# Array con los nombres de las carpetas que deseas crear
$folders = @(
    "controller",
    "dto",
    "entity",
    "exception",
    "repository",
    "service"
)

# Crea las carpetas
foreach ($folder in $folders) {
    $path = Join-Path -Path $basePath -ChildPath $folder
    New-Item -ItemType Directory -Path $path -Force

# Crea subcarpeta impl dentro de service
    if ($folder -eq "service") {
        $implPath = Join-Path -Path $path -ChildPath "impl"
        New-Item -ItemType Directory -Path $implPath -Force
    }
}
