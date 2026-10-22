return {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name)
                return name == ".."
            end,
        },
        -- ruff sometimes crashes on startup, perhaps this will help
        lsp_file_methods = {
            enabled = false, -- Disable LSP for oil buffers
        },
    },
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Oil" }
    },
}
