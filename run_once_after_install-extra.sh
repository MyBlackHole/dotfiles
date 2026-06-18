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

install_one() {
    local pkg="$1"
    if pacman -Q "$pkg" &>/dev/null; then
        echo "  -> $pkg 已安装，跳过"
        return 0
    fi
    paru -S --noconfirm "$pkg" && echo "  -> $pkg 安装完成" || echo "  -> 注意: $pkg 安装失败"
}

echo ">>> 安装系统包和字体（extra 源）..."
for pkg in $(pkg_list ~/.config/niri/pkgs-extra.txt); do
    install_one "$pkg"
done

echo ">>> 启用系统服务..."
sudo systemctl enable --now iwd.service bluetooth.service 2>/dev/null || true

echo ">>> 启用用户服务..."
systemctl --user enable --now wireplumber.service 2>/dev/null || true
systemctl --user enable --now pipewire.socket pipewire-pulse.socket 2>/dev/null || true

if command -v bun &>/dev/null; then
    echo ">>> 安装 bun 全局包..."
    for pkg in $(pkg_list ~/.config/niri/pkgs-bun.txt); do
        if bun pm ls -g 2>/dev/null | grep -qF " $pkg@"; then
            echo "  -> $pkg 已安装，跳过"
        else
            bun install -g "$pkg" && echo "  -> $pkg 安装完成" || echo "  -> 注意: $pkg 安装失败"
        fi
    done
fi
