#!/bin/bash
# osf-dev.sh
# usage: ./path/to/osf-dev.sh /path/to/osf.txt /path/to/target-repo
# e.g.,  ./dev/osf-dev.sh ./dev/osf.txt ../extended_language_network-osf

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "usage: $0 <osf-include-file> <target-repo-dir>"
    exit 1
fi

INCLUDE_FILE="$1"
DEST="$2"
SRC="$(pwd)"

# sanity checks
if [ ! -f "$INCLUDE_FILE" ]; then
    echo "error: inclusion file '$INCLUDE_FILE' does not exist"
    exit 1
fi
if [ ! -d "$DEST" ]; then
    echo "error: destination repo '$DEST' does not exist"
    exit 1
fi

echo "syncing files from $SRC -> $DEST using $INCLUDE_FILE"

shopt -s nullglob

while IFS= read -r relative_path || [[ -n "$relative_path" ]]; do
    # skip empty lines or comments
    [[ -z "$relative_path" || "$relative_path" =~ ^# ]] && continue

    if [[ "$relative_path" == *'*'* ]]; then
        # Handle wildcard paths
        matches=($SRC/$relative_path)
        if [ ${#matches[@]} -eq 0 ]; then
            echo "warning: no matches for pattern '$relative_path', skipping"
            continue
        fi
        for match in "${matches[@]}"; do
            # get relative path from SRC
            rel="${match#$SRC/}"
            src_path="$match"
            dest_path="$DEST/$rel"

            if [ ! -e "$src_path" ]; then
                echo "warning: '$src_path' does not exist, skipping"
                continue
            fi

            mkdir -p "$(dirname "$dest_path")"

            if [ -d "$src_path" ]; then
                rsync -avh --delete --exclude='.git/' -L "$src_path"/ "$dest_path"/
            else
                cp -L "$src_path" "$dest_path"
            fi
        done
    else
        src_path="$SRC/$relative_path"
        dest_path="$DEST/$relative_path"

        if [ ! -e "$src_path" ]; then
            echo "warning: '$src_path' does not exist, skipping"
            continue
        fi

        mkdir -p "$(dirname "$dest_path")"

        if [ -d "$src_path" ]; then
            rsync -avh --delete --exclude='.git/' -L "$src_path"/ "$dest_path"/
        else
            cp -L "$src_path" "$dest_path"
        fi
    fi

done < "$INCLUDE_FILE"

echo "done!"