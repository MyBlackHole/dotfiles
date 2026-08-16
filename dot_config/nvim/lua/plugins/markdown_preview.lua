return {
  -- Markdown 浏览器预览（Mermaid 完整渲染，弥补 alacritty 终端无法内联显示图形的限制）
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = function()
      require("lazy").load { plugins = { "markdown-preview.nvim" } }
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = "dark"
    end,
    keys = {
      { "<leader>mb", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown 浏览器预览（切换）" },
    },
  },
}