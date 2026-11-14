#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm cargo cmake sdl3

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Making stable build of OpenUnleashed..."
echo "---------------------------------------------------------------"
REPO="https://github.com/Second-Boot/Open-Unleashed"
VERSION="$(git ls-remote --tags --sort="v:refname" "$REPO" | tail -n1 | sed 's/.*\///; s/\^{}//; s/^v//')"
git clone --branch v"$VERSION" --single-branch --depth 1 "$REPO" ./xemu
echo "$VERSION" > ~/version

mkdir -p ./AppDir/bin
