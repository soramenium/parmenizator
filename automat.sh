#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="$SCRIPT_DIR/modules"

if "$MODULES_DIR/is_os_supported.sh"; then
    "$MODULES_DIR/check_os.sh"
else
    echo "Niewspierany system"
fi