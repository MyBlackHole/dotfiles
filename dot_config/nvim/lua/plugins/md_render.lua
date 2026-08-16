return {
  -- Markdown 渲染引擎（纯终端预览，支持 Mermaid/表格/图片/视频/CJK 换行）
  {
    "delphinus/md-render.nvim",
    version = "*",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", version = "*" }, -- 代码块文件类型图标
      { "delphinus/budoux.lua", version = "*" }, -- CJK 短语级换行
    },
    cmd = { "MdRender", "MdRenderTab", "MdRenderPager", "MdRenderDemo" },
    keys = {
      { "<leader>mp", "<Plug>(md-render-preview)", desc = "Markdown 预览（浮动窗口切换）" },
      { "<leader>mt", "<Plug>(md-render-preview-tab)", desc = "Markdown 预览（tab 切换）" },
      { "<leader>md", "<Plug>(md-render-demo)", desc = "Markdown 渲染 demo" },
    },
  },
}