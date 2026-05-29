#!/usr/bin/env bash
set -euo pipefail

pkg_list() {
    sed -e 's/#.*//' -e '/^[[:space:]]*$/d' "$1"
}

install_one() {
    local pkg="$1"
    if pacman -Q "$pkg" &>/dev/null; then
        echo "  -> $pkg 已安装，跳过"
        return 0
    fi
    paru -S --noconfirm "$pkg" && echo "  -> $pkg 安装完成" || echo "  -> 注意: $pkg 安装失败（可能已有冲突版本）"
}

echo ">>> 安装 AUR 包..."
for pkg in $(pkg_list ~/.config/niri/pkgs-aur.txt); do
    install_one "$pkg"
done
