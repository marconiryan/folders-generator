#!/bin/bash

# Default number of levels
levels=50

# Default base directory
base_directory="."

while [[ $# -gt 0 ]]; do
    case "$1" in
        --levels=*)
            levels="${1#*=}"
            shift
            ;;
        --path=*)
            base_directory="${1#*=}"
            shift
            ;;
        *)
            echo "Usage: $0 [--levels=<number>] [--path=<directory>] "
            exit 1
            ;;
    esac
done

if [ ! -d "$base_directory" ]; then
    echo "Error: The specified directory does not exist."
    echo "Usage: $0 [--levels=<number>] [--path=<directory>] "
    exit 1
fi

for ((i = 1; i <= levels; i++)); do
    current_directory="$(mktemp -d "$base_directory/level_XXXXXXXX$i")"
    base_directory="$current_directory"
    echo "hello" > "$current_directory/hello_$i.txt"
done

echo "Created $levels levels of folders with random names and archives in $base_directory"
