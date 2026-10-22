return {
    {
        'echasnovski/mini.icons',
        lazy = true,
        config = true,
    },
    {
        'echasnovski/mini.pairs',
        config = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    },
    {
        'echasnovski/mini.ai',
        config = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    },
    {
        'echasnovski/mini.cursorword',
        enabled = false,
        config = function()
            vim.api.nvim_set_hl(0, 'MiniCursorword', { link = 'Search' })
            vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', { link = 'MiniCursorword' })

            require('mini.cursorword').setup()
        end,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    },
    {
        'echasnovski/mini.surround',
        config = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    },
    {
        'echasnovski/mini.hipatterns',
        config = function()
            local hipatterns = require('mini.hipatterns')
            hipatterns.setup({
                highlighters = {
                    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                    -- Highlight hex color strings (`#rrggbb`) using that color
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
        end,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    },
    {
        'echasnovski/mini.trailspace',
        config = true,
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    },
}
