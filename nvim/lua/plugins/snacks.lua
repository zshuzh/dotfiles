local SIDEBAR_OPTS = {
    layout = {
        preset = 'sidebar'
    },
    win = {
        input = {
            keys = {
                ["<CR>"] = { "focus_preview", mode = { "n", "i" } },
            },
        },
        list = {
            keys = {
                ["<CR>"] = "focus_preview",
                ["<S-CR>"] = { "open", mode = { "n", "i" } },
            },
        },
        preview = {
            keys = {
                ["<CR>"] = "focus_input",
                ["<leader>/"] = "focus_input",
                ["<Esc>"] = false,
            },
        },
    },
}

--TODO:
-- lazygit
-- jumplist
-- LSP rename
return {
    -- lazy.nvim will merge the opts, allowing the different packages under snacks.nvim to be
    -- configured separately, even though they share the same name
    -- TODO: doesn't load unless the whole package is lazy-loaded by one of the key triggers
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            scroll = {
                enabled = true,
            },
        },
    },
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            terminal = {
                enabled = true,
                -- subshells are non-login, interactive shells which means ~/.zlogin is not run
                shell = "zsh --login",
            },
            ---@type table<string, snacks.win.Config>
            styles = {
                terminal = {
                    keys = {
                        term_normal = { "<esc>", function() vim.cmd("stopinsert") end, mode = "t", expr = true, desc = "Double escape to normal mode" },
                    },
                },
            },
        },
        keys = {
            { "<leader>j", function() Snacks.terminal.open(nil, { win = { position = 'bottom' } }) end, desc = "Bottom terminal" },
            { "<leader>l", function() Snacks.terminal.open(nil, { win = { position = 'right' } }) end,  desc = "Right terminal" },
        },
    },
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {
            ---@class snacks.picker.projects.Config: snacks.picker.Config
            picker = {
                enabled = true,
                hidden = true,
                ignored = true,
                exclude = {
                    'node_modules/',
                    '.venv/',
                    '.git/',
                    'dist/',
                    '**/generated/**/*',
                    '.next/',
                    '*.js.map',
                    '*._.js'
                },
                patterns = { ".git", "package.json", ".code-workspace", "*.code-workspace" },
            },
        },
        keys = {
            -- TODO: without this require the Snacks global is not defined acoording to the linter
            { "<leader>f", function() require('snacks').picker() end, desc = "All pickers" },
            { "<leader>p", function() Snacks.picker.smart() end,      desc = "Smart Find Files" },
            {
                "<leader>P",
                function()
                    Snacks.picker.projects({
                        dev = { "~/Developer/isometric" },
                        patterns = { "*.code-workspace" }
                    })
                end,
                desc = "Projects"
            },
            -- TODO: the preview window doesn't have LSP functionality, how to turn it into a regular buffer?
            { "<leader>/",  function() Snacks.picker.grep() end,                       desc = "Grep" },
            { "<leader>?",  function() Snacks.picker.grep(SIDEBAR_OPTS) end,           desc = "Grep (sidebar)" },
            { "<leader>:",  function() Snacks.picker.command_history() end,            desc = "Command History" },
            { "<leader>c",  function() Snacks.picker.colorschemes() end,               desc = "Colorschemes" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end,               desc = "Git log file" },
            { "<leader>gl", function() Snacks.picker.git_log_line() end,               desc = "Git log line" },
            { "<leader>u",  function() Snacks.picker.undo() end,                       desc = "Undo" },
            { "<leader>b",  function() Snacks.picker.buffers() end,                    desc = "Buffers" },
            { "<leader>x",  function() Snacks.picker.diagnostics_buffer() end,         desc = "Diagnostics (buffer)" },
            { "<leader>X",  function() Snacks.picker.diagnostics() end,                desc = "Diagnostics" },
            { "gd",         function() Snacks.picker.lsp_definitions() end,            desc = "Goto Definition" },
            { "gD",         function() Snacks.picker.lsp_declarations() end,           desc = "Goto Declaration" },
            { "gr",         function() Snacks.picker.lsp_references() end,             nowait = true,                  desc = "References" },
            { "gR",         function() Snacks.picker.lsp_references(SIDEBAR_OPTS) end, nowait = true,                  desc = "References (sidebar)" },
            { "gI",         function() Snacks.picker.lsp_implementations() end,        desc = "Goto Implementation" },
            { "gy",         function() Snacks.picker.lsp_type_definitions() end,       desc = "Goto T[y]pe Definition" },
            { "<leader>o",  function() Snacks.picker.lsp_symbols() end,                desc = "LSP Symbols" },
            { "<leader>O",  function() Snacks.picker.lsp_workspace_symbols() end,      desc = "LSP Workspace Symbols" },
        }
    },
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            image = {
                enabled = true,
            }
        }
    },
    -- better `vim.ui.input` (which is used by default by `vim.lsp.buf.rename`)
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            input = {
                enabled = true
            }
        }
    },
}
