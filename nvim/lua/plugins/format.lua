return {
    'stevearc/conform.nvim',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    -- TODO: make mason auto-install prettierd and oxfmt like mason-lspconfig does...
    opts = {
        formatters_by_ft = {
            javascript = { "biome-check" },
            typescript = { "biome-check" },
            javascriptreact = { "biome-check" },
            typescriptreact = { "biome-check" },
            css = { "prettierd" },
            html = { "prettierd" },
            json = { "prettierd" },
            jsonc = { "prettierd" },
            markdown = { "prettierd" },
            yaml = { "prettierd" },
            rust = { "rustfmt" },
            lua = { lsp_format = "fallback" },
            c = { lsp_format = "fallback" },
            cpp = { lsp_format = "fallback" },
            python = { "ruff_fix", "ruff_format" },
            go = { "gofmt" },
        },
    },
}
