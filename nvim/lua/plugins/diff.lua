return {
    'sindrets/diffview.nvim',
    keys = {
        { "<leader>dd", "<cmd>DiffviewOpen<cr>" },                    -- diff current changes
        { "<leader>dp", "<cmd>DiffviewOpen @~ @<cr>" },               -- diff current pr
        { "<leader>ds", "<cmd>DiffviewOpen origin/HEAD...HEAD<cr>" }, -- diff current stack
    },
    config = function()
        vim.opt.fillchars:append { diff = "╱" }

        local diffview = require('diffview')

        local opts = {
            enhanced_diff_hl = true,
            hooks = {
                diff_buf_read = function()
                    vim.opt_local.relativenumber = false
                    vim.opt_local.diffopt = 'internal,filler,algorithm:patience'
                end,
            },
            keymaps = {
                view = {
                    ["q"] = "<Cmd>DiffviewClose<CR>",
                },
                file_panel = {
                    ["q"] = "<Cmd>DiffviewClose<CR>",
                },
                file_history_panel = {
                    ["q"] = "<Cmd>DiffviewClose<CR>",
                },
            },
        }

        diffview.setup(opts)
    end
}
