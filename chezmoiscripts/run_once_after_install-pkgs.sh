#!/usr/bin/env bash
set -euo pipefail

# 检查是否已安装 (用 niri 做标识)
if pacman -Q niri &>/dev/null; then
    echo ">>> niri 已安装, 跳过包安装"
    exit 0
fi

echo ">>> 安装系统包..."
if command -v paru &>/dev/null; then
    paru -S --needed --noconfirm $(cat ~/.config/niri/pkgs.txt)
elif command -v yay &>/dev/null; then
    yay -S --needed --noconfirm $(cat ~/.config/niri/pkgs.txt)
elif command -v pacman &>/dev/null; then
    sudo pacman -S --needed $(cat ~/.config/niri/pkgs.txt)
else
    echo "! 未检测到包管理器, 手动安装:"
    cat ~/.config/niri/pkgs.txt
fi
