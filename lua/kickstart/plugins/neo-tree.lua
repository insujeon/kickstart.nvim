-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    -- { '\\', ':Neotree reveal_force_cwd<CR>', desc = 'NeoTree reveal with prompt', silent = true },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_default', -- Ensures no conflicts with netrw
      respect_buf_cwd = true, -- Neo-tree will use the buffer's directory
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      bind_to_cwd = false, -- Neo-tree's root won't follow Neovim's cwd
      cwd_target = {
        sidebar = 'global', -- or "window" depending on your preference
        current = 'window', -- when position = "current"
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
