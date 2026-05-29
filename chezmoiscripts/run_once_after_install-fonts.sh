#!/usr/bin/env bash
set -euo pipefail
# 检查是否已安装
if pacman -Q ttf-jetbrains-mono-nerd &>/dev/null; then
    exit 0
fi
echo ">>> 安装字体..."
if command -v paru &>/dev/null; then
    paru -S --needed --noconfirm $(cat ~/.config/hypr/fonts.txt)
elif command -v yay &>/dev/null; then
    yay -S --needed --noconfirm $(cat ~/.config/hypr/fonts.txt)
else
    echo "! 请手动安装字体: $(cat ~/.config/hypr/fonts.txt)"
fi
