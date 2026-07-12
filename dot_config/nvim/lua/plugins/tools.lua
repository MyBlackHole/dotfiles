return {
  -- 翻译
  {
    "voldikss/vim-translator",
    keys = {
      {
        "<leader>tt",
        mode = { "v" },
        "<cmd>Translate<cr>",
        desc = "Translate",
      },
      {
        "<leader>tr",
        mode = { "v" },
        "<cmd>TranslateR<cr>",
        desc = "TranslateR",
      },
      {
        "<leader>tl",
        mode = { "v" },
        "<cmd>TranslateL<cr>",
        desc = "TranslateL",
      },
      {
        "<leader>th",
        mode = { "v" },
        "<cmd>TranslateH<cr>",
        desc = "TranslateH",
      },
      {
        "<leader>tw",
        mode = { "v" },
        "<cmd>TranslateW<cr>",
        desc = "TranslateW",
      },
      {
        "<leader>tx",
        mode = { "v" },
        "<cmd>TranslateX<cr>",
        desc = "TranslateX",
      },
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
