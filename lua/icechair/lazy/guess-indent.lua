return {
  'NMAC427/guess-indent.nvim',
  config = function()
    local gi = require 'guess-indent'
    gi.setup {
      auto_cmd = true,
      override_editorconfig = true,
      buftype_exclude = {
        'help',
        'nofile',
        'terminal',
        'prompt',
      },
      on_tab_options = {
        ['expandtab'] = false,
      },
      on_space_options = {
        ['expandtab'] = true,
        ['tabstop'] = 'detected',
        ['softtabstop'] = 'detected',
        ['shiftwidth'] = 'detected',
      },
    }
  end,
}
