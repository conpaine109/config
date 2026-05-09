#!/usr/bin/env sh

# Update...
url='https://mirror.givebytes.net/archlinux/iso/2026.05.01/'

iso='archlinux-2026.05.01-x86_64.iso'
iso_sig='archlinux-2026.05.01-x86_64.iso.sig'
sha256sums='sha256sums.txt'

curl -Os $url$iso
curl -Os $url$iso_sig
curl -Os $url$sha256sums

echo "--- Downloaded files ---\n"

# verify checksums and sigs
echo "\n--- Checksum ---\n"
head -n 1 $sha256sums | shasum -a 256 -c - 

echo "\n--- Sig check ---\n"
gpg --auto-key-locate clear,wkd -v --locate-external-key pierre@archlinux.org
gpg --verify $iso_sig $iso

echo "\n--- DONE ---"
