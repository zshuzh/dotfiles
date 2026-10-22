return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        keys = {
            { '<leader>i', '<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>', desc = "Toggle inlay hints" },
            { '<leader>r', '<CMD>lua vim.lsp.buf.rename()<CR>',                                           desc = "Rename symbol" },
            { '<leader>.', '<CMD>lua vim.lsp.buf.code_action()<CR>',                                      desc = "Code actions" },
        }
    },
    {
        'williamboman/mason.nvim',
        opts = {},
        keys = {
            { "<cmd>Mason<cr>", desc = "Mason" }
        },
    },
    -- TODO: replace nvim-lspconfig builtin vim.lsp.config()
    -- see: https://gpanders.com/blog/whats-new-in-neovim-0-11/#lsp
    {
        -- needs to be after neovim/nvim-lspconfig
        'williamboman/mason-lspconfig.nvim',
        lazy = true,
        opts = {
            ensure_installed = {
                'lua_ls',
                'clangd',
                'asm_lsp',
                'rust_analyzer',
                'emmet_language_server',
                'tailwindcss',
                'oxlint',
                'tsgo',         --typescript
                'ts_ls',
                'basedpyright', -- python
                'ruff',         -- python
                'gopls',
                -- https://github.com/graphql/graphiql/issues/3620
                'graphql',
            },
            handlers = {
                -- default handler
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        -- TODO: can be removed in future
                        -- see: https://cmp.saghen.dev/
                        -- see: https://github.com/neovim/nvim-lspconfig/issues/3494
                        capabilities = require('blink.cmp').get_lsp_capabilities()
                    })
                end,
                -- custom handlers
                ["lua_ls"] = function()
                    require('lspconfig').lua_ls.setup({
                        capabilities = require('blink.cmp').get_lsp_capabilities(),
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                                format = { defaultConfig = { indent_size = "2", } }
                            }
                        }
                    })
                end,
                -- https://docs.astral.sh/ruff/editors/setup/#neovim
                ["basedpyright"] = function()
                    require('lspconfig').basedpyright.setup({
                        capabilities = require('blink.cmp').get_lsp_capabilities(),
                        settings = {
                            pyright = { disableOrganizeImports = true, },
                            python = { analysis = { ignore = { '*' } } },
                        },
                    })
                end,
                -- https://www.tailwind-variants.org/docs/getting-started#intellisense-setup-optional
                ["tailwindcss"] = function()
                    require('lspconfig').tailwindcss.setup({
                        capabilities = require('blink.cmp').get_lsp_capabilities(),
                        settings = {
                            tailwindCSS = {
                                experimental = {
                                    classRegex = {
                                        { "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" }
                                    },
                                },
                            },
                        },
                    })
                end,
                ["rust_analyzer"] = function()
                    require('lspconfig').rust_analyzer.setup({
                        capabilities = require('blink.cmp').get_lsp_capabilities(),
                        checkOnSave = { command = "clippy" },
                        settings = {
                            ["rust-analyzer"] = {
                                checkOnSave = true,
                                check = {
                                    enable = true,
                                    command = "clippy",
                                    features = "all",
                                },
                            },
                        },
                    })
                end,
            }
        },
        dependencies = {
            'neovim/nvim-lspconfig'
        }
    },
}
