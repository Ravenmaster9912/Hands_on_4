#!/bin/bash

# Función para mostrar el menú
function show_menu() {
    echo "Seleccione una opción:"
    echo "1) Listar el contenido de un fichero (carpeta)"
    echo "2) Crear un archivo de texto con una línea de texto"
    echo "3) Comparar dos archivos de texto"
    echo "4) Mostrar ejemplo de uso de 'awk'"
    echo "5) Mostrar ejemplo de uso de 'grep'"
    echo "6) Salir"
    echo
}

# Función para listar el contenido de un fichero (carpeta)
function list_directory() {
    read -p "Ingrese la ruta absoluta de la carpeta: " dir_path
    if [ -d "$dir_path" ]; then
        echo "Contenido de $dir_path:"
        ls -l "$dir_path"
    else
        echo "La ruta especificada no es una carpeta válida."
    fi
}

# Función para crear un archivo de texto con una línea de texto
function create_text_file() {
    read -p "Ingrese el nombre del archivo a crear: " file_name
    read -p "Ingrese la línea de texto para almacenar en el archivo: " text_line
    echo "$text_line" > "$file_name"
    echo "Archivo '$file_name' creado con el contenido especificado."
}

# Función para comparar dos archivos de texto
function compare_files() {
    read -p "Ingrese la ruta del primer archivo: " file1
    read -p "Ingrese la ruta del segundo archivo: " file2
    if [ -f "$file1" ] && [ -f "$file2" ]; then
        diff "$file1" "$file2"
        if [ $? -eq 0 ]; then
            echo "Los archivos son idénticos."
        else
            echo "Los archivos son diferentes."
        fi
    else
        echo "Uno o ambos archivos no existen."
    fi
}

# Función para mostrar ejemplo de uso de 'awk'
function awk_example() {
    echo "Ejemplo de uso de 'awk':"
    echo "Lista el segundo campo de cada línea en /etc/passwd (usualmente el nombre de usuario):"
    awk -F: '{print $1}' /etc/passwd
}

# Función para mostrar ejemplo de uso de 'grep'
function grep_example() {
    read -p "Ingrese el término a buscar en /var/log/syslog: " search_term
    echo "Mostrando las líneas en /var/log/syslog que contienen '$search_term':"
    grep "$search_term" /var/log/syslog
}

# Ciclo principal para mostrar el menú y procesar la elección del usuario
while true; do
    show_menu
    read -p "Seleccione una opción: " choice
    case $choice in
        1) list_directory ;;
        2) create_text_file ;;
        3) compare_files ;;
        4) awk_example ;;
        5) grep_example ;;
        6) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción inválida. Intente nuevamente." ;;
    esac
    echo
done