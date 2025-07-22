return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    -- branch = 'main', --  return to main later, when it will be more stable
    tag = "v0.10.0", -- don't forget to update when 'ft_to_lang' exception will be fixed
    build = ':TSUpdate',
    dependencies = {
        {
            "LiadOz/nvim-dap-repl-highlights",
            opts = {
                
            }
        },
    },

    config = function()
      local cfg = require("nvim-treesitter.configs")
      cfg.setup({
        highlight = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'v',
                node_incremental = 'v',
                node_decremental = 'V',
            },
        },
        ensure_installed = {
          'dap_repl', -- for highlighting in dap (debug) REPL 
          'bash',
          'cmake',
          'comment',
          'dockerfile',
          'diff',
          'git_config',
          'git_rebase',
          'gitcommit',
          'gitignore',
          'html',
          'gpg',
          'javascript',
          'json',
          'jsonc',
          'lua',
          'luadoc',
          'luap',
          'markdown',
          'markdown_inline',
          'printf',
          'python',
          'query',
          'regex',
          'ssh_config',
          'toml',
          'typescript',
          'vim',
          'vimdoc',
          'xml',
          'yaml',

          'c',
          'cpp',
          'java',
          'javadoc',
          'kotlin',
        },
      })
    end,
}
