return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    session_lens = {
        mappings = {
            -- TODO: add 'dd' mapping to delete session in a picker
        },
    },
  },
  keys = {
    { '<leader>fs', '<cmd>SessionSearch<CR>', desc = 'Session search' },
    { '<leader>ss', '<cmd>SessionSave<CR>', desc = 'Save session' },
  },
}
