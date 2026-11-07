return {
    "numToStr/Comment.nvim",
    opts = {
        sticky = true,
        toggler = {
            line = '<leader>c',
            block = 'gbc',
        },
        opleader = {
            line = '<leader>c',
            block = 'gb',
        },
        post_hook = function(ctx)
            if ctx.range.srow == ctx.range.erow then
                vim.cmd('norm! j') -- move to next line if single line comment
            end
        end
    }
}
