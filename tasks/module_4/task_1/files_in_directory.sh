#!/bin/bash

function count_files {
    local dir="$1"
    local count=0


    count=$(ls -1 "$dir" | wc -l)

    # Count the number of files in subdirectories
    for subdir in "$dir"/*; do
        if [ -d "$subdir" ]; then
            count=$((count + $(count_files "$subdir")))
        fi
    done

    echo "$count"
}

for dir in "$@"; do
    count=$(count_files "$dir")
    echo "Directory '$dir' has $count files."
done
