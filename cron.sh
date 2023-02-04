#!/bin/bash

set -e
set -x

# change to this script home directory.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
(
    cd "$SCRIPT_DIR"
    /usr/bin/make build 
    /usr/bin/make upload
)
