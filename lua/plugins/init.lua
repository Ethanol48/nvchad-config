return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    config = function(_, _)
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, buffer)
            require("nvchad.configs.lspconfig").on_attach(client, buffer)
          end,
        },
      }
    end,
  },

  "nvim-lua/plenary.nvim",
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.tree-sitter",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- snippets que no quiero ver en el menú
      local blocked = { ["#guard"] = true }
      for _, src in ipairs(opts.sources) do
        if src.name == "luasnip" then
          -- filtra por el nombre del snippet (no el trigger) para no ocultar el mío
          src.entry_filter = function(entry)
            local snip = require("luasnip").get_id_snippet(entry.completion_item.data.snip_id)
            return not (snip and blocked[snip.name])
          end
        end
      end
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = require "configs.colorizer",
    },
  },
}
