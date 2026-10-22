return {
    {

        'lewis6991/gitsigns.nvim',
        -- copied from here: https://github.com/LazyVim/LazyVim/discussions/1583
        -- not ideal since I don't think it includes the defer and re-trigger
        -- behaviour mentioned by folke in the linked GH discussion above
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {
            signs = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '' },
                topdelete = { text = '' },
                changedelete = { text = '▎' },
                untracked = { text = '▎' },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                map('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                -- Actions
                -- TODO: figure out keymaps without <leader>
                map('n', '<leader>hp', gs.preview_hunk)
                map('n', '<leader>hs', gs.stage_hunk)
                map('n', '<leader>hr', gs.reset_hunk)
                map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
            end
        },
    },
    {
        'f-person/git-blame.nvim',
        lazy = true,
        opts = { display_virtual_text = 0, message_template = '<author> • <date>', },
        keys = {
            { "<leader>gc", "<CMD>GitBlameOpenCommitURL<CR>", desc = "Open Commit URL" }
        }
    },
    {
        -- note: gitsigns has blame functionality but this is nicer
        "FabijanZulj/blame.nvim",
        config = true,
        keys = {
            { "<leader>gb", "<cmd>BlameToggle virtual<cr>" },
        },
    },
}
