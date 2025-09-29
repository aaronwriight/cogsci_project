#!/bin/bash
# osf-dev.sh
# usage: ./osf-dev.sh /path/to/source/osf /path/to/target-repo

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "usage: $0 <source-osf-dir> <target-repo-dir>"
    exit 1
fi

SRC="$1"
DEST="$2"

# sanity checks
if [ ! -d "$SRC" ]; then
    echo "error: source directory '$SRC' does not exist"
    exit 1
fi
if [ ! -d "$DEST" ]; then
    echo "error: destination repo '$DEST' does not exist"
    exit 1
fi

# make sure we're copying into the root of the -osf repo
DEST_OSF="$DEST/osf"
mkdir -p "$DEST_OSF"

echo "syncing $SRC -> $DEST_OSF"

# choose mode: -L follows symlinks (dereference), no -L preserves them
# uncomment ONE of the following rsync commands:

# 1. follow symlinks (actual files copied, recommended for OSF)
rsync -avh --delete -L "$SRC"/ "$DEST_OSF"/

# 2. keep symlinks as symlinks
# rsync -avh --delete "$SRC"/ "$DEST_OSF"/

echo "done!"