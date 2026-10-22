-- non-exhaustive example triggers:
-- "InsertLeave" = Esc (only if you were in insert mode before)
-- "TextChanged" = x, d, dd, D (annoying because if you "x" a trailing comma, it seems like the keyboard doesn't work)
-- "TextChangedI" = typing (too eager)
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    callback = function()
        if vim.bo.filetype == "oil" then
            return
        end

        if #vim.api.nvim_buf_get_name(0) ~= 0 and
            vim.bo.buflisted and
            vim.bo.buftype == "" and
            vim.bo.modifiable and
            vim.bo.modified
        then
            vim.cmd "silent w"
        end
    end,
})

vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
    nested = true, -- allows recursive triggering of "BufWritePre" autocommands
    callback = function()
        if #vim.api.nvim_buf_get_name(0) ~= 0 and
            vim.bo.buflisted and
            vim.bo.buftype == ""
        then
            vim.cmd "silent wa"
        end
    end,
})

-- "editor.formatOnSave": true,
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- "files.trimFinalNewlines": true,
-- "files.trimTrailingWhitespace": true,
vim.api.nvim_create_autocmd("BufWritePre", {
    -- pattern = vim.fn.expand("~/Developer/isometric") .. "/*",
    pattern = "*",
    callback = function(args)
        require('mini.trailspace').trim()
        require('mini.trailspace').trim_last_lines()
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 500
        })
    end,
})
