#!/usr/bin/env sh

set -e

# Update script later...
# MacOS HTTP(S) pulldown of arch ISO 

url='https://mirror.givebytes.net/archlinux/iso/2026.05.01/'

iso='archlinux-2026.05.01-x86_64.iso'
iso_sig='archlinux-2026.05.01-x86_64.iso.sig'
sha256sums='sha256sums.txt'

curl -Os $url$iso
curl -Os $url$iso_sig
curl -Os $url$sha256sums

echo '--- Downloaded files ---\n'

# verify checksums and sigs
echo '\n--- Checksum ---\n'
grep $iso $sha256sums | shasum -a 256 -c - 

echo '\n--- Sig check ---\n'
gpg --auto-key-locate clear,wkd -v --locate-external-key pierre@archlinux.org
gpg --verify $iso_sig $iso

echo '\n--- CP to volume ---\n'
vol=$1

if [[ -n $vol ]]; then
    vol_path="/Volumes/$vol"
    d="$(diskutil info "$vol_path" | awk -F': *' '/Part of Whole/ { print $2 }')"

    if [[ -z "$d" ]]; then
        echo "Whole disk missing for $vol_path"
        exit 1
    fi

    read -p "Wipe $vol_path? (YES/NO): " wipe
    if [[ $wipe == 'YES' ]]; then
        diskutil unmountDisk "/dev/$d" && sudo dd if=$iso of="/dev/r$d" bs=1m
        sync
        diskutil eject "/dev/$d"
    else
        echo "Aborting wipe..."
        exit 1
    fi
else
    echo "(skipping)"
fi

echo '\n--- Removing files ---\n'
rm $iso $iso_sig $sha256sums

echo '\n--- DONE ---'
