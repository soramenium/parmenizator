#!/bin/bash
check_os() {
    if [[ ! -f /etc/os-release ]]; then
        echo "ERROR: Nie można ustalić systemu operacyjnego."
        exit 1
    fi

    source /etc/os-release

    case "$ID:$VERSION_ID" in
        debian:13|fedora:45)
            echo "Supported: $PRETTY_NAME"
            OS_TYPE="$ID"
            return true
            ;;
        *)
            echo "ERROR: Nieobsługiwany system: $PRETTY_NAME"
            return false
            ;;
    esac
}

# Poniższy fragment odpowiada za wykrycie czy skrypt uruchomiono bezpośrednio, jeśli tak to wykona funkcję
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    check_os
fi
