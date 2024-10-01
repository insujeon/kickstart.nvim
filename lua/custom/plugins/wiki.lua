return {

  -- { 'serenevoid/kiwi.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   opts = {
  --     {
  --       name = 'work',
  --       path = '/home/wiz/wiki/work',
  --     },
  --     {
  --       name = 'personal',
  --       path = '/home/wiz/wiki/personal',
  --     },
  --   },
  --   keys = {
  --     { '<leader>ww', ':lua require("kiwi").open_wiki_index()<cr>', desc = 'Open Wiki index' },
  --     { '<leader>wp', ':lua require("kiwi").open_wiki_index("personal")<cr>', desc = 'Open index of personal wiki' },
  --     { 'T', ':lua require("kiwi").todo.toggle()<cr>', desc = 'Toggle Markdown Task' },
  --   },
  --   lazy = true,
  -- },

  -- {
  --   'lervag/wiki.vim',
  --   config = function()
  --     -- Optional configuration for wiki.vim
  --     vim.g.wiki_root = '~/wiki/'
  --     vim.g.wiki_filetypes = { 'md' }
  --   end,
  -- },

  -- NOTE: instead of the config field (ran after the plugin is loaded), I am using the init field (ran before the plugin is loaded).
  {
    'vimwiki/vimwiki',
    branch = 'dev',
    init = function()
      print 'Setting up vimwiki!'
      vim.g.vimwiki_list = {
        {
          -- template_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/vimwiki/autoload/',
          syntax = 'markdown',
          ext = '.md',
          path = '~/wiki/work', -- does not work?=!?!?
          diary_rel_path = 'diary',
        },
        {
          syntax = 'markdown',
          ext = '.md',
          path = '~/wiki/personal',
          diary_rel_path = 'diary',
        },
      }

      -- Set global vimwiki configuration
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_conceallevel = 3

      -- Key mappings for vimwiki commands
      -- vim.api.nvim_set_keymap('n', '<localLeader>ww', '<Plug>VimwikiIndex', { noremap = false, silent = true })
      -- vim.api.nvim_set_keymap('n', '<localLeader>wi', '<Plug>VimwikiDiaryIndex', { noremap = false, silent = true })
      -- vim.api.nvim_set_keymap('n', '<localLeader>w<LocalLeader>w', '<Plug>VimwikiMakeDiaryNote', { noremap = false, silent = true })
      vim.keymap.set('n', '<leader>w<leader>t', ':VimwikiTable<CR>', { desc = '[W]iki [T]able', noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', '<localLeader>wt', ':VimwikiTable<CR>', { noremap = true, silent = true })

      -- F4 to search for word under cursor in the wiki
      vim.api.nvim_set_keymap('n', '<F4>', ':execute "VWS /" .. vim.fn.expand("<cword>") .. "/" <Bar> :lopen<CR>', { noremap = true, silent = true })

      -- Shift F4 to search for all documents linking to the current one
      vim.api.nvim_set_keymap('n', '<S-F4>', ':VWB<CR>:lopen<CR>', { noremap = true, silent = true })
    end,
  },
}
