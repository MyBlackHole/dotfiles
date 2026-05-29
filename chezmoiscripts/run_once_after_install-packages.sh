#!/usr/bin/env bash
set -euo pipefail

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

echo ">>> 启用系统服务..."
sudo systemctl enable --now iwd.service bluetooth.service 2>/dev/null || true

echo ">>> 启用用户服务..."
systemctl --user enable --now wireplumber.service 2>/dev/null || true
systemctl --user enable --now pipewire.socket pipewire-pulse.socket 2>/dev/null || true
