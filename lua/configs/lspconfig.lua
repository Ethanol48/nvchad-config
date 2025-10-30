-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "templ", "gopls", "tailwindcss", "pylsp", "ts_ls", "clangd" } -- ocaml

local util = require "lspconfig/util"

-- Custom configs

-- Solidity
vim.lsp.config("solidity_ls", {
  cmd = { "vscode-solidity-server", "--stdio" },
  filetypes = { "solidity" },
  root_dir = util.root_pattern("hardhat.config.js", "foundry.toml", ".git"),
  settings = {
    solidity = {
      compileUsingRemoteVersion = "latest",
      defaultCompiler = "remote",
      enabledAsYouTypeCompilationErrorCheck = true,
    },
  },
})

-- Rust
vim.lsp.config("rust_analyzer", {
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
})

local servers_web = { "html", "cssls" }
vim.lsp.enable(servers)

for _, lsp in pairs(servers_web) do
  vim.lsp.config(lsp, {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

-- Svelte work aorund
vim.lsp.config("svelte", {
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
})
