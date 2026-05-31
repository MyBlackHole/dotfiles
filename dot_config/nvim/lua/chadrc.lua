-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "github_dark",
	transparency = true,

	hl_override = {
		-- 透明背景下模式指示器文字改成白色（原 fg = black 看不见）
		St_NormalMode   = { fg = "#ffffff", bg = "#58a6ff", bold = true },
		St_InsertMode   = { fg = "#ffffff", bg = "#bc8cff", bold = true },
		St_VisualMode   = { fg = "#ffffff", bg = "#56d4dd", bold = true },
		St_CommandMode  = { fg = "#ffffff", bg = "#56d364", bold = true },
		St_ReplaceMode  = { fg = "#ffffff", bg = "#ffab70", bold = true },
		St_TerminalMode = { fg = "#ffffff", bg = "#56d364", bold = true },
		-- 状态栏其它文字用亮色确保可读
		StatusLine      = { fg = "#ffffff" },
		StatusLineNC    = { fg = "#8b949e" },
		ST_EmptySpace   = { fg = "#ffffff" },
		St_file         = { fg = "#ffffff" },
		St_file_sep     = { fg = "#ffffff" },
		St_gitIcons     = { fg = "#d3dbe3", bold = true },
		St_Lsp          = { fg = "#58a6ff" },
		St_LspMsg       = { fg = "#56d364" },
		St_cwd_icon     = { fg = "#ffffff" },
		St_cwd_text     = { fg = "#ffffff" },
		St_cwd_sep      = { fg = "#ffffff" },
		St_pos_sep      = { fg = "#ffffff" },
		St_pos_icon     = { fg = "#ffffff" },
		St_pos_text     = { fg = "#ffffff" },
	},
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
      statusline = {
         -- 透明背景下去掉 / 分隔符（透明背景下只剩空轮廓）
         separator_style = { left = "", right = "" },
      },
      tabufline = {
         lazyload = false,
         order = { "treeOffset", "buffers", "tabs" },
     }
}

return M
