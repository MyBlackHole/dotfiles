# dotfiles

Niri 桌面环境配置，由 chezmoi 管理。

## 使用

### 新机器恢复

```bash
# 1. 安装核心工具
sudo pacman -S chezmoi git base-devel

# 2. 恢复配置（先恢复文件，再自动执行安装脚本）
chezmoi init --apply git@github.com:MyBlackHole/dotfiles.git
```

恢复过程会自动执行两个安装脚本（按字母序，extra 先于 aur）：
1. **`run_once_after_install-extra.sh`** — 安装 paru → extra 源包 + 字体 → 启用系统服务
2. **`run_once_after_install-aur.sh`** — 安装 AUR 包（edge、flclash）

> 如果 aur 脚本失败，修复后执行 `chezmoi state delete --script run_once_after_install-aur.sh` 清掉状态，再 `chezmoi apply` 重试即可。

### 日常更新

```bash
# 拉取最新配置并应用
chezmoi update

# 预览将要变更的内容
chezmoi diff

# 添加新文件到管理
chezmoi add ~/.config/xxx/file

# 编辑管理中的文件
chezmoi edit ~/.config/xxx/file
```

## 包含内容

- **窗口管理器**: niri
- **状态栏**: waybar (style.css + theme.css)
- **启动器**: fuzzel
- **通知**: mako
- **剪贴板**: clipcat
- **锁屏**: swaylock + swayidle
- **注销**: wlogout
- **终端**: alacritty
- **输入法**: fcitx5 (fcitx5-qt, fcitx5-gtk, fcitx5-chinese-addons, fcitx5-configtool)
- **主题**: GTK3/4, Qt5/6, Kvantum, nwg-look
- **文件管理**: dolphin + ark
- **编辑器**: neovim
- **系统信息**: fastfetch
- **Shell**: zsh + p10k + tmux + eza + starship + atuin
- **浏览器**: microsoft-edge-stable
- **代理**: flclash
- **开发**: rustup, uv
- **字体**: CascadiaCode, JetBrainsMono, Material Icons, Noto CJK
