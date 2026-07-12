require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- 删除默认配置的代码树打开影射
unmap("n", "<leader>e")
unmap("n", "<leader>x")
unmap("n", "<leader>b")
unmap("n", "<leader>h")


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- 使 ; 同步为 :
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "ESC exit insert mode" })
-- lsp hover / signature help 浮窗加圆角边框
map("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end, { desc = "LSP hover documentation" })
-- lsp 定义跳转 + 推入 tag stack（方便 <C-t> 回退）
map("n", "gd", function()
  vim.lsp.buf.definition()
  pcall(vim.cmd, "tag") -- push position to tag stack
end, { desc = "LSP go to definition" })
-- lsp 重命名
map("n", "grn", vim.lsp.buf.rename, { desc = "rename symbol under cursor" })
map("n", "gra", vim.lsp.buf.code_action, { desc = "run code action" })
map("n", "grr", vim.lsp.buf.references, { desc = "find references" })
map("i", "<C-s>", function() vim.lsp.buf.signature_help({ border = "rounded" }) end, { desc = "show signature help" })

map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- buffer 管理
map("n", "<leader>bx", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "buffer new" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Flash
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })
map({ "n", "o", "x" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
  require("flash").remote()
end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
map("c", "<c-s>", function()
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- 翻译
map("v", "<leader>tt", "<cmd>Translate<cr>", { desc = "Translate" })
map("v", "<leader>tr", "<cmd>TranslateR<cr>", { desc = "TranslateR" })
map("v", "<leader>tl", "<cmd>TranslateL<cr>", { desc = "TranslateL" })
map("v", "<leader>th", "<cmd>TranslateH<cr>", { desc = "TranslateH" })
map("v", "<leader>tw", "<cmd>TranslateW<cr>", { desc = "TranslateW" })
map("v", "<leader>tx", "<cmd>TranslateX<cr>", { desc = "TranslateX" })

-- gitsigns
map("n", "]c", function()
  local gitsigns = require("gitsigns")
  if vim.wo.diff then
    vim.cmd.normal({ "]c", bang = true })
  else
    gitsigns.nav_hunk("next")
  end
end, { desc = "Next hunk" })

map("n", "[c", function()
  local gitsigns = require("gitsigns")
  if vim.wo.diff then
    vim.cmd.normal({ "[c", bang = true })
  else
    gitsigns.nav_hunk("prev")
  end
end, { desc = "Previous hunk" })

map("n", "<leader>hs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage hunk" })
map("n", "<leader>hr", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("v", "<leader>hs", function()
  require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage visual selection" })
map("v", "<leader>hr", function()
  require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset visual selection" })
map("n", "<leader>hS", function()
  require("gitsigns").stage_buffer()
end, { desc = "Stage all hunks" })
map("n", "<leader>hu", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Undo stage hunk" })
map("n", "<leader>hR", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset all hunks" })
map("n", "<leader>hp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
map("n", "<leader>hb", function()
  require("gitsigns").blame_line({ full = true })
end, { desc = "Blame line" })
map("n", "<leader>tb", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle current line blame" })
map("n", "<leader>hd", function()
  require("gitsigns").diffthis()
end, { desc = "Diff this file" })
map("n", "<leader>hD", function()
  require("gitsigns").diffthis("~")
end, { desc = "Diff against previous" })
map("n", "<leader>td", function()
  require("gitsigns").toggle_deleted()
end, { desc = "Toggle deleted" })
map({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<cr>", { desc = "Select hunk" })
