require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- 写入文件的编码
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8,gbk"
vim.opt.fileformats = "unix"
vim.auto_complete = true
-- -- 搜索到文件两端时不重新搜索
-- vim.opt.nowrapscan = true
-- 允许neovim 访问系统剪贴板
vim.opt.clipboard = "unnamedplus"
-- 突出显示搜索模式的所有匹配项
vim.opt.hlsearch = true
-- 创建备份文件
vim.opt.backup = false
-- 总是显示标签
vim.opt.showtabline = 2
-- 设置编号行
vim.opt.number = true
-- 高亮当前行
vim.opt.cursorline = true
-- 将行显示为一长行
vim.opt.wrap = false
-- 移动光标时保留上下左右指定行列
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- 将制表符转换为空格
vim.opt.expandtab = true
-- 如果一个文件正在被另一个程序编辑（或在另一个程序编辑时被写入文件），则不允许编辑它
vim.opt.writebackup = false
-- 启用持久撤销
vim.opt.undofile = true
-- 创建交换文件
vim.opt.swapfile = false
-- 再次让缩进更智能
vim.opt.smartindent = true
-- 智能案例
vim.opt.smartcase = true
-- 换行缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- 自动缩进:产考上一行
vim.opt.autoindent = true
-- 使用C/C++语言自动缩进
vim.opt.cindent = true
-- 关闭鼠标
vim.opt.mouse = ""
-- 开启光标所在行相对行号
vim.opt.relativenumber = true
-- 命令行高度
vim.opt.cmdheight = 1
-- 启用语法高亮
vim.opt.syntax = "enable"
-- 按语法高亮折叠
-- vim.opt.foldmethod = "indent"
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- 显示所有符号
vim.opt.list = true
-- 光标在行首的时候，使用左右方向键可以跳转到上一行或下一行
vim.opt.whichwrap = "<,>,[,]"
-- 当文件被外部程序修改的时候 自动加载修改后的内容
vim.g.autoread = true
vim.bo.autoread = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- 透明背景（Neovim 完全启动后强制覆盖）
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        vim.cmd("highlight Normal guibg=NONE")
        vim.cmd("highlight NonText guibg=NONE")
        vim.cmd("highlight NormalFloat guibg=NONE")
        vim.cmd("highlight TabLine guibg=NONE")
        vim.cmd("highlight StatusLine guibg=NONE")
        vim.cmd("highlight StatusLineNC guibg=NONE")
        vim.cmd("highlight WinBar guibg=NONE")
        vim.cmd("highlight WinBarNC guibg=NONE")
        -- 所有 St_* 组透明背景
        for _, hl in ipairs(vim.fn.getcompletion("St_", "highlight")) do
            pcall(vim.cmd, "highlight " .. hl .. " guibg=NONE")
        end
        -- 模式指示器文字加白加粗（无背景色，仅靠白色字体凸显）
        for _, hl in ipairs({ "St_NormalMode", "St_InsertMode", "St_VisualMode",
                              "St_CommandMode", "St_ReplaceMode", "St_TerminalMode",
                              "St_NTerminalMode", "St_SelectMode" }) do
            pcall(vim.cmd, "highlight " .. hl .. " guifg=#ffffff guibg=NONE guibold=true")
        end
        -- cwd/pos 图标原版 fg 是深色（one_bg/black），透明背景后看不见
        for _, hl in ipairs({ "St_cwd_icon", "St_pos_icon" }) do
            pcall(vim.cmd, "highlight " .. hl .. " guifg=#ffffff guibg=NONE")
        end
        -- 标签栏组透明
        for _, hl in ipairs(vim.fn.getcompletion("Tb", "highlight")) do
            pcall(vim.cmd, "highlight " .. hl .. " guibg=NONE")
        end
    end,
})



-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- 自动操作
vim.api.nvim_create_autocmd(
    "BufWinEnter",
    {
        pattern = { "*.py", "*.c", "*.h", "*.cpp", "Makefile", "*.s", "*.ld", "*.S", "*.mk", "*.html", "*.md" },
        -- enable wrap mode for json files only
        command = "%s/[\\u0d]//ge",
    }
)
