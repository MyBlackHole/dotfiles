#!/usr/bin/env bash
set -euo pipefail

pkg_list() {
    sed -e 's/#.*//' -e '/^[[:space:]]*$/d' "$1"
}

echo ">>> 安装 AUR 包..."
pkg_list ~/.config/niri/pkgs-aur.txt | xargs paru -S --needed --noconfirm
