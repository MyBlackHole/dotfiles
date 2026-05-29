#!/usr/bin/env bash
set -euo pipefail

if pacman -Q niri &>/dev/null; then
    echo ">>> niri 已安装, 跳过"
    exit 0
fi

install_paru() {
    command -v paru &>/dev/null && return
    echo ">>> 安装 paru..."
    sudo pacman -S --needed --noconfirm base-devel git
    local tmpdir
    tmpdir="$(mktemp -d)"
    git clone --depth=1 https://aur.archlinux.org/paru-bin.git "$tmpdir"
    (cd "$tmpdir" && makepkg -si --noconfirm)
    rm -rf "$tmpdir"
}

pkg_list() {
    sed -e 's/#.*//' -e '/^[[:space:]]*$/d' "$1"
}

install_paru

echo ">>> 安装系统包..."
pkg_list ~/.config/niri/pkgs.txt | xargs paru -S --needed --noconfirm

echo ">>> 安装字体..."
pkg_list ~/.config/niri/fonts.txt | xargs sudo pacman -S --needed --noconfirm
