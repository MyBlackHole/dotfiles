return {
  -- 诊断信息
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = function() end,
  },
  -- 跳跃定位
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  },
}
