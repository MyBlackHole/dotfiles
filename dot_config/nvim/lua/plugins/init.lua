return {
  -- {
  --   "nickjvandyke/opencode.nvim",
  --   version = "*", -- Latest stable release
  --   dependencies = {
  --     {
  --       -- `snacks.nvim` integration is recommended, but optional
  --       ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
  --       "folke/snacks.nvim",
  --       optional = true,
  --       opts = {
  --         input = {}, -- Enhances `ask()`
  --         picker = { -- Enhances `select()`
  --           actions = {
  --             opencode_send = function(...)
  --               return require("opencode").snacks_picker_send(...)
  --             end,
  --           },
  --           win = {
  --             input = {
  --               keys = {
  --                 ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
  --               },
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  --   config = function()
  --     ---@type opencode.Opts
  --     vim.g.opencode_opts = {
  --       -- Your configuration, if any; goto definition on the type or field for details
  --     }
  --
  --     vim.o.autoread = true -- Required for `opts.events.reload`
  --
  --     -- Recommended/example keymaps
  --     vim.keymap.set({ "n", "x" }, "<C-a>", function()
  --       require("opencode").ask("@this: ", { submit = true })
  --     end, { desc = "Ask opencode…" })
  --     vim.keymap.set({ "n", "x" }, "<C-x>", function()
  --       require("opencode").select()
  --     end, { desc = "Execute opencode action…" })
  --     vim.keymap.set({ "n", "t" }, "<C-.>", function()
  --       require("opencode").toggle()
  --     end, { desc = "Toggle opencode" })
  --
  --     vim.keymap.set({ "n", "x" }, "go", function()
  --       return require("opencode").operator "@this "
  --     end, { desc = "Add range to opencode", expr = true })
  --     vim.keymap.set("n", "goo", function()
  --       return require("opencode").operator "@this " .. "_"
  --     end, { desc = "Add line to opencode", expr = true })
  --
  --     vim.keymap.set("n", "<S-C-u>", function()
  --       require("opencode").command "session.half.page.up"
  --     end, { desc = "Scroll opencode up" })
  --     vim.keymap.set("n", "<S-C-d>", function()
  --       require("opencode").command "session.half.page.down"
  --     end, { desc = "Scroll opencode down" })
  --
  --     -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
  --     vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
  --     vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  --   end,
  -- },
  -- 格式化
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- 语言 lsp
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- 语法
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    build = ":TSUpdate",
  },
  -- 诊断信息
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
  -- {
  --   "Mythos-404/xmake.nvim",
  --   lazy = true,
  --   -- event = "BufReadPost xmake.lua",
  --   config = true,
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  -- },
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
