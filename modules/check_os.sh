#!/bin/bash
if [[ ! -f /etc/os-release ]]; then
    echo "ERROR: Nie można ustalić systemu operacyjnego."
    exit 1
fi

echo "odczytuję informacje o systemie operacyjnym z /etc/os-release..."
source /etc/os-release

case "$ID:$VERSION_ID" in
    debian:13|fedora:45)
        echo "Wykryto obsługiwany system: $PRETTY_NAME"
        OS_TYPE="$ID"
        ;;
    *)
        echo "ERROR: Nieobsługiwany system: $PRETTY_NAME"
        exit 1
        ;;
esac