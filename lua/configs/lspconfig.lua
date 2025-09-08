-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "templ", "gopls", "tailwindcss", "pylsp", "ocamllsp", "nim_langserver", "clangd" } -- ocaml

local util = require "lspconfig/util"
local nvlsp = require "nvchad.configs.lspconfig"

-- local rt = require("rust-tools")
--
-- rt.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
-- })

lspconfig.solidity_ls.setup{
    cmd = { "vscode-solidity-server", "--stdio" },
    filetypes = { "solidity" },
    root_dir = lspconfig.util.root_pattern("hardhat.config.js", "foundry.toml", ".git"),
    settings = {
        solidity = {
            compileUsingRemoteVersion = 'latest',
            defaultCompiler = 'remote',
            enabledAsYouTypeCompilationErrorCheck = true,
        },
    }
}

-- setup formaters

-- crear codigo pereza

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- lspconfig.solidity.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "solidity" },
--   root_dir = util.root_pattern(".git")
-- }


-- Old Rust config

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}



-- typescript

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- Set up LSP servers with the same config
local servers_web = { "html", "cssls" }
for _, lsp in pairs(servers_web) do
  require("lspconfig")[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

-- Svelte work aorund
lspconfig.svelte.setup {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
      end,
    })
  end,
}
