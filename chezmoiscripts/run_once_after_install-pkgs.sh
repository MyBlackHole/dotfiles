#!/usr/bin/env bash
set -euo pipefail

# 检查是否已安装 (用 niri 做标识)
if pacman -Q niri &>/dev/null; then
    echo ">>> niri 已安装, 跳过包安装"
    exit 0
fi

# 安装 paru (AUR helper)
install_paru() {
    if command -v paru &>/dev/null; then
        return 0
    fi
    echo ">>> 安装 paru..."
    sudo pacman -S --needed --noconfirm base-devel git
    local tmpdir=$(mktemp -d)
    git clone --depth=1 https://aur.archlinux.org/paru-bin.git "$tmpdir"
    cd "$tmpdir" && makepkg -si --noconfirm
    rm -rf "$tmpdir"
}

echo ">>> 安装系统包..."
install_paru
paru -S --needed --noconfirm $(cat ~/.config/niri/pkgs.txt)
