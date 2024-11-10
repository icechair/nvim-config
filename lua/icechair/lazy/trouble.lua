return {
  { 'nvim-tree/nvim-web-devicons' },
  {
    'folke/trouble.nvim',
    config = function()
      local trouble = require 'trouble'
      trouble.setup {}
      vim.keymap.set('n', '<leader>xx', function()
        trouble.toggle 'diagnostics'
      end, { desc = 'toggle trouble' })
      vim.keymap.set('n', '<leader>xq', function()
        trouble.toggle 'qflist'
      end, { desc = 'toggle Quickfixes' })
    end,
  },
}
