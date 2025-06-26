return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    -- branch = 'main', --  return to main later, when it will be more stable
    tag = "v0.10.0", -- don't forget to update when 'ft_to_lang' exception will be fixed
    build = ':TSUpdate',

    config = function()
      local cfg = require("nvim-treesitter.configs")
      cfg.setup({
        highlight = { enable = true },
        ensure_installed = {
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
