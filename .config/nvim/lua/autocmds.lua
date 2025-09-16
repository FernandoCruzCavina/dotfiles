require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimResized", {
  callback = function()
    vim.cmd("wincmd =")
  end,
})
