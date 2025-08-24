return {
  "nguyenvukhang/nvim-toggler",
  config = function()
    -- init.lua
    require("nvim-toggler").setup {
      -- your own inverses
      inverses = {
        ["true"] = "false",
      },
      -- removes the default <leader>i keymap
      remove_default_keybinds = true,
      -- removes the default set of inverses
      remove_default_inverses = true,
      -- auto-selects the longest match when there are multiple matches
      autoselect_longest_match = false,
    }
    -- init.lua
    vim.keymap.set({ 'n', 'v' }, '<leader>cl', require('nvim-toggler').toggle)
  end,
}
