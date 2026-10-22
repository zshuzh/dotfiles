return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    config = function()
        local gitblame = require('gitblame')

        -- https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#customizing-themes
        -- FIX: customising the auto theme breaks the auto update functionality
        -- i.e. changing colorschemes `:co tokyodark` doesn't update lualine
        -- auto selection of colorscheme on startup still works however
        -- local custom_auto_theme = require('lualine.themes.auto')
        -- custom_auto_theme.normal.c.bg = 'none'

        require('lualine').setup({
            options = {
                -- theme = custom_auto_theme,
                -- https://github.com/nvim-lualine/lualine.nvim#disabling-separators
                section_separators = '',
                component_separators = '',
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    { 'mode' },
                },
                lualine_b = {
                    {
                        'branch',
                        fmt = function(str)
                            local len = 42
                            if string.len(str) > len then
                                return string.sub(str, 1, len / 2) ..
                                    '…' .. string.sub(str, str:len() - len / 2 + 1, str:len())
                            else
                                return str
                            end
                        end,
                    },
                },
                lualine_c = {
                    { gitblame.get_current_blame_text, cond = gitblame.is_blame_text_available },
                },
                lualine_x = {
                    { 'diagnostics', always_visible = true },
                },
                lualine_y = {
                    { 'progress' }
                },
                lualine_z = {
                    { 'location' }
                }
            },
            tabline = {
                lualine_a = {
                    function()
                        return [[ ]] .. vim.fn.getpid()
                    end
                },
                lualine_b = {
                    {
                        'filename',
                        path = 1,
                        fmt = function(str)
                            return str:match("///(.*)") or str
                        end,
                    },
                },
                lualine_c = {
                    { 'aerial' },
                },
                lualine_y = {
                    { 'diff' },
                },
                lualine_z = {
                    { 'tabs' }
                }
            },
            extensions = { "trouble" },
        })
    end,
}
