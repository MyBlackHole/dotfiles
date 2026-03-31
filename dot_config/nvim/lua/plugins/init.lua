return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "html",
        "css",
        "c",
        "cpp",
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = function() end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
    event = { "BufRead" },
  },
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
  -- 跳跃定位
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "Mythos-404/xmake.nvim",
    lazy = true,
    -- event = "BufReadPost xmake.lua",
    config = true,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  },
  -- :Fitten login BlackHole 1358
  {
    "luozhiya/fittencode.nvim",
    cmd = "Fitten",
    event = { "BufRead" },
    config = function()
      require("fittencode").setup()
    end,
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   event = { "BufRead" },
  --   config = function()
  --     require("codecompanion").setup {
  --       strategies = {
  --         chat = {
  --           adapter = "ollama",
  --         },
  --         inline = {
  --           adapter = "ollama",
  --         },
  --       },
  --       debug = true,
  --     }
  --   end,
  -- },
}
