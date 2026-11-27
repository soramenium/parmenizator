#!/bin/bash
installer(){
    if $OS_TYPE == "debian"; then
        echo "Instalacja na Debianie"
        # Tutaj dodaj polecenia instalacyjne dla Debiana
    elif $OS_TYPE == "fedora"; then
        echo "Instalacja na Fedorze"
        # Tutaj dodaj polecenia instalacyjne dla Fedory
    else
        echo "Nieobsługiwany system operacyjny: $OS_TYPE"
        exit 1
    fi

}

# Poniższy fragment odpowiada za wykrycie czy skrypt uruchomiono bezpośrednio, jeśli tak to wykona funkcję
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    installer
fi