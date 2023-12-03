# Crear un script avanzado para el monitoreo de recursos del sistema que cumpla con los siguientes requisitos:
# - Mostrar la cantidad de memoria RAM libre y utilizada.
# - Visualizar la utilización del espacio en disco.
# - Ofrecer la opción de listar los procesos en ejecución y sus recursos asociados.

# Asegurarse de que el script solicite los permisos necesarios para ejecutar los comandos y manejar posibles errores o conflictos, como la falta de permisos o comandos no disponibles.

# Usage:
# ./script.sh --memory-usage
# ./script.sh --disk-usage
# ./script.sh --list-processes

# Functions

function memory_usage {
    free -h
}

function disk_usage {
    df -h
}

function list_processes {
    ps aux
}

# Main

case "$1" in
    --memory-usage)
        memory_usage
        ;;
    --disk-usage)
        disk_usage
        ;;
    --list-processes)
        list_processes
        ;;
    *)
        echo "Invalid option"
        ;;
esac
