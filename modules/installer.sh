#!/bin/bash

if [ "$OS_TYPE" == "debian" ]; then
    echo "Instalacja na Debianie"
    echo "wczytuję listę pakietów z pliku pakiety_debian.txt..."
    mapfile -t PACKAGES < $SCRIPT_DIR/pakiety_debian.txt
    echo "Aktualizacja listy pakietów i instalacja wymaganych pakietów..."
    sudo apt update && sudo apt install -y $PACKAGES

elif [ "$OS_TYPE" == "fedora" ]; then
    echo "Instalacja na Fedorze"
    echo "wczytuję listę pakietów z pliku pakiety_fedora.txt..."
    mapfile -t PACKAGES < $SCRIPT_DIR/pakiety_fedora.txt
    echo "Aktualizacja listy pakietów i instalacja wymaganych pakietów..."
    sudo dnf update && sudo dnf install -y $PACKAGES

else
    echo "Nieobsługiwany system operacyjny: $OS_TYPE"
    exit 1

fi

