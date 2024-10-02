return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = '<A-p>', -- Jump to previous suggestion
          jump_next = '<A-n>', -- Jump to next suggestion
          accept = '<A-y>', -- Accept the current suggestion
          refresh = 'gr', -- Manually refresh suggestions
          open = '<A-o>', -- Open the Copilot panel
        },
        layout = {
          position = 'bottom', -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '<A-y>', -- Accept the current suggestion
          accept_word = '<A-w>', -- Accept the current suggestion word or false
          accept_line = '<A-l>', -- Accept the current suggestion line or false
          next = '<A-n>', -- Show next suggestion
          prev = '<A-p>', -- Show previous suggestion
          dismiss = '<A-\\>', -- Dismiss the current suggestion
        },
      },
      filetypes = {
        python = true,
        yaml = false,
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    }
  end,
}
