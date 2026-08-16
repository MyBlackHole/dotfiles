return {
  -- Markdown 浏览器预览（Mermaid 完整渲染，弥补 alacritty 终端无法内联显示图形的限制）
  -- lazy=false: 插件无 lua 入口(lua/ 目录), ft/cmd/keys 懒加载均无法触发, 只能常驻加载(仅 152 行 vim 脚本+惰性 autoload, 开销极小)
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
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