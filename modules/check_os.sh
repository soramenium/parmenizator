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
            ;;
        *)
            echo "ERROR: Nieobsługiwany system: $PRETTY_NAME"
            exit 1
            ;;
    esac
}
#file refresh bo chmod
check_os