#!/bin/bash

echo "wewmątrez installera $OS_TYPE"

if [ "$OS_TYPE" == "debian" ]; then
    echo "Instalacja na Debianie"
    mapfile -t PACKAGES < pakiety_debian.txt
    sudo apt update && sudo apt install -y $PACKAGES

elif [ "$OS_TYPE" == "fedora" ]; then
    echo "Instalacja na Fedorze"
    mapfile -t PACKAGES < pakiety_fedora.txt
    sudo dnf update && sudo dnf install -y $PACKAGES

else
    echo "Nieobsługiwany system operacyjny: $OS_TYPE"
    exit 1

fi

