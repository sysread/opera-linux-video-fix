#!/usr/bin/env bash

set -eu

if [ "$(readlink -- /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so)" = /usr/lib/chromium/libffmpeg.so ]; then
    echo "Opera ffmpeg video workaround is already set up"
    exit 0
fi

if [ -z "$(command -v chromium)" ]; then
    echo "Installing chromium to use its libffmpeg.so in opera"
    apt install chromium
fi

if [ -e /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so.bak ]; then
    echo "Old /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so.bak found - deleting it"
    rm /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so.bak 
fi

# Remove old symlink if it exists
[ -s /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so ] || rm /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so 

if [ -e /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so ]; then
    echo "Backing up existing /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so"
    mv /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so.bak
fi

ln -s /usr/lib/chromium/libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so
