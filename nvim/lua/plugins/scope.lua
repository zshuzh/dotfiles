return {
    {
        'hiphish/rainbow-delimiters.nvim',
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        main = 'rainbow-delimiters.setup',
        opts = {
            query = {
                [''] = 'rainbow-delimiters',
                tsx = 'rainbow-parens',
            },
        }
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        main = 'ibl',
        opts = {
            scope = {
                enabled = false,
            },
            indent = {
                char = "▏",
                tab_char = "▏",
            },
        },
    },
    {
        'nmac427/guess-indent.nvim',
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        config = true,
    }
}
