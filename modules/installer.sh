#!/bin/bash

PACKAGE_FILE="$SCRIPT_DIR/packages.txt"

if [[ ! -f "$PACKAGE_FILE" ]]; then
    echo "ERROR: Nie znaleziono packages.txt"
    echo "Nie zainstalowano."
    exit 1
fi

# Pobranie pakietów
PACKAGES=$(awk -v section="[$OS_TYPE]" '
    $0 == section { found=1; next }
    /^\[/ { found=0 }
    found && NF && $1 !~ /^#/ { print $1 }
' "$PACKAGE_FILE")

if [[ -z "$PACKAGES" ]]; then
    echo "ERROR: Brak pakietów dla $OS_TYPE"
    echo "Nie zainstalowano."
    exit 1
fi


installer(){
    if [ "$OS_TYPE" == "debian" ]; then
        echo "Instalacja na Debianie"
        sudo apt update && sudo apt install -y $PACKAGES
    elif [ "$OS_TYPE" == "fedora" ]; then
        echo "Instalacja na Fedorze"
        sudo dnf install -y $PACKAGES
    else
        echo "Nieobsługiwany system operacyjny: $OS_TYPE"
        exit 1
    fi

}

# Poniższy fragment odpowiada za wykrycie czy skrypt uruchomiono bezpośrednio, jeśli tak to wykona funkcję
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    installer
fi