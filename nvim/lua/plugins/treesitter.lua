return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false, -- main branch does not support lazy-loading
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install({
                "asm",
                "bash",
                "c", "cpp", "rust", "go",
                "lua", "vim", "vimdoc", "query",
                "markdown", "markdown_inline",
                "html", "css", "javascript", "typescript", "tsx",
                "python", "graphql",
            })

            local highlight_fts = {
                "asm",
                "bash", "sh",
                "c", "cpp", "rust", "go",
                "lua", "vim", "help", "query",
                "markdown",
                "html", "css", "javascript", "typescript", "typescriptreact",
                "python", "graphql",
            }

            vim.api.nvim_create_autocmd('FileType', {
                pattern = highlight_fts,
                callback = function()
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            max_lines = 3,
            multiline_threshold = 1,
        }
    }
}
