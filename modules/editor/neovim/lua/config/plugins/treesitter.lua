return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main', --  return to main later, when it will be more stable
    build = ':TSUpdate',
    dependencies = {
        {
            "LiadOz/nvim-dap-repl-highlights",
            opts = {}
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = 'main',
            opts = {
                lookahead = true,
                selection_modes = {
                  ['@parameter.outer'] = 'v', -- charwise
                  ['@function.outer'] = 'V', -- linewise
                  ['@class.outer'] = '<c-v>', -- blockwise
                },
            }
        }
    },

    config = function()
      local sitter = require("nvim-treesitter")
      sitter.setup()

      local parsers = {
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
      }
      sitter.install(parsers)
      vim.api.nvim_create_autocmd('FileType', {
          pattern = { '<filetype>' },
          callback = function(args)
              local buf = args.buf
                local filetype = args.match

                -- you need some mechanism to avoid running on buffers that do not
                -- correspond to a language (like oil.nvim buffers), this implementation
                -- checks if a parser exists for the current language
                local language = vim.treesitter.language.get_lang(filetype) or filetype
                if not vim.treesitter.language.add(language) then
                    return
              end
              vim.treesitter.start()
          end,
      })

    vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
    callback = function()
        local parser_config = require("nvim-treesitter.parsers")
        parser_config.cangjie = {
          install_info = {
            url ="https://gitcode.com/Cangjie-SIG/tree-sitter-cangjie",
            -- files = { "src/parser.c", "src/scanner.c" },
            branch = "main",
            generate = false,
            generate_from_json = false,
            queries = "queries",
         },
        }
    end})

    vim.treesitter.language.register('cangjie', { 'cj' })
    if not vim.filetype.match({ filename = "cangjie" }) then
        vim.filetype.add({
            extension = {
                cj = "cangjie",
            },
        })
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'cangjie' },
      callback = function() vim.treesitter.start() end,
    })
    end,
}
