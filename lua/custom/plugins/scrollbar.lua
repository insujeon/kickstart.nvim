return {
  -- Install and configure nvim-scrollbar with Lazy
  -- Other plugins...
  -- {
  --   'petertriho/nvim-scrollbar',
  --   config = function()
  --     require('scrollbar').setup()
  --   end,
  -- },
  -- BUG: conflict with telescope and note highlight
  --
  {
    'dstein64/nvim-scrollview',
    version = '*', -- This will fetch the latest version of the plugin
    config = function()
      require('scrollview').setup {
        excluded_filetypes = { 'nerdtree' }, -- Exclude specific filetypes
        current_only = true, -- Show scrollbar for the current buffer only
        base = 'buffer', -- Position the scrollbar relative to the buffer
        column = vim.o.columns - 4, --80, -- Show the scrollbar in the 80th column
        signs_on_startup = { 'all' }, -- Enable all sign groups (e.g., diagnostics, search)
        diagnostics_severities = { vim.diagnostic.severity.ERROR }, -- Show diagnostic signs only for errors
      }
    end,
  },
}
