vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  once = true,
  callback = function()
    pcall(function()
      local config = require("nvim-tree.config")
      config.g.actions.file_popup.open_win_config = vim.tbl_deep_extend(
        "force",
        config.g.actions.file_popup.open_win_config or {},
        { border = "rounded" }
      )
    end)
  end,
})
