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
-- lsp 重命名
map("n", "grn", vim.lsp.buf.rename, { desc = "rename symbol under cursor" })
map("n", "gra", vim.lsp.buf.code_action, { desc = "run code action" })
map("n", "grr", vim.lsp.buf.references, { desc = "find references" })
map("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "show signature help" })

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

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end, {desc = 'Next hunk'})

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end, {desc = 'Previous hunk'})

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk, {desc = 'Stage hunk'})
    map('n', '<leader>hr', gitsigns.reset_hunk, {desc = 'Reset hunk'})
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Stage visual selection'})
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Reset visual selection'})
    map('n', '<leader>hS', gitsigns.stage_buffer, {desc = 'Stage all hunks'})
    map('n', '<leader>hu', gitsigns.undo_stage_hunk, {desc = 'Undo stage hunk'})
    map('n', '<leader>hR', gitsigns.reset_buffer, {desc = 'Reset all hunks'})
    map('n', '<leader>hp', gitsigns.preview_hunk, {desc = 'Preview hunk'})
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, {desc = 'Blame line'})
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, {desc = 'Toggle current line blame'})
    map('n', '<leader>hd', gitsigns.diffthis, {desc = 'Diff this file'})
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end, {desc = 'Diff against previous'})
    map('n', '<leader>td', gitsigns.toggle_deleted, {desc = 'Toggle deleted'})

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {desc = 'Select hunk'})
  end
}
