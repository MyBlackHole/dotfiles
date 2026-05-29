# dotfiles

Niri 桌面环境配置，由 chezmoi 管理。

## 使用

### 新机器恢复

```bash
# 1. 安装核心工具
sudo pacman -S chezmoi git base-devel

# 2. 一键恢复（自动装 paru → 系统包 → 字体 → 启用服务）
chezmoi init --apply git@github.com:MyBlackHole/dotfiles.git
```

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
- **输入法**: fcitx5
- **主题**: GTK3/4, Qt5/6, Kvantum, nwg-look
- **系统信息**: fastfetch
- **Shell**: zsh + p10k + tmux
- **字体**: CascadiaCode, JetBrainsMono, MapleMono, Mononoki
