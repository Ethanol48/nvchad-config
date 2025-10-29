require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local api = vim.api

api.nvim_create_autocmd("Filetype", {
  pattern = "c",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true  -- opcional, si quieres usar espacios en lugar de tabs
  end,
})
