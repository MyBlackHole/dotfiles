return {
  -- 翻译
  {
    "voldikss/vim-translator",
    cmd = {
      "Translate",
      "TranslateR",
      "TranslateL",
      "TranslateH",
      "TranslateW",
      "TranslateX",
    },
  },
  -- AI/补全工具
  {
    "luozhiya/fittencode.nvim",
    cmd = "Fitten",
    event = { "BufRead" },
    config = function()
      require("fittencode").setup()
    end,
  },
}
