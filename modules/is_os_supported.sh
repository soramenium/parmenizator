#!/bin/bash
is_os_supported() {
    source /etc/os-release
    case "$ID:$VERSION_ID" in
        debian:13|fedora:45)
            echo true
            ;;
        *)
            echo false
            ;;
    esac
}

is_os_supported