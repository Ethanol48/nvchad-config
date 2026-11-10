require "nvchad.options"

-- add yours here!

-- rustaceanvim v5 uses deprecated Neovim 0.12 APIs; suppress until upstream fixes it
local _orig_deprecate = vim.deprecate
vim.deprecate = function(name, ...)
  local rustaceanvim_noise = {
    ["client.request"] = true,
    ["client.supports_method"] = true,
    ["vim.lsp.get_buffers_by_client_id()"] = true,
    ["vim.validate{<table>}"] = true,
  }
  if not rustaceanvim_noise[name] then
    _orig_deprecate(name, ...)
  end
end

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

local api = vim.api

api.nvim_create_autocmd("Filetype", {
  pattern = "c",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true -- opcional, si quieres usar espacios en lugar de tabs
  end,
})

require('nvim-treesitter').install({
    "vim",
    "lua",
    "vimdoc",
    "lua",
    "html",
    "css",
    "svelte",
    "markdown",
    "markdown_inline",
    "typescript",
    "c",
    "go",
    "rust"
}):wait(300000) -- wait max. 5 minutes


