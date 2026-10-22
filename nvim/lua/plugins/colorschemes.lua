-- use _theme variable
-- local DEFAULT_THEME = 'kanso-zen'
local DEFAULT_THEME = 'rose-pine'
local TRANSPARENT = vim.env.TERM_PROGRAM == 'WezTerm' or vim.env.TERM_PROGRAM == 'ghostty'

local colorschemes = {
    {
        "oskarnurm/koda.nvim",
        opts = {
            transparent = true,
            styles = {
                functions = { italic = false, bold = false },
                keywords  = { italic = false, bold = false },
                comments  = { italic = false, bold = false },
                strings   = { italic = false, bold = false },
                constants = { italic = false, bold = false },
            },
        },
        _requires = 'koda',
        _themes = { 'koda' },
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        opts = {
            styles = {
                bold = false,
                transparency = TRANSPARENT,
            },
        },
        _requires = 'rose-pine',
        _themes = { 'rose-pine' },
    },
    {
        'folke/tokyonight.nvim',
        opts = {
            transparent = TRANSPARENT,
            dim_inactive = true,
            on_highlights = function(hl, c)
                hl.TelescopeNormal = { fg = c.fg_dark, bg = nil }
                -- for some reason this doesn't actually change the telescope border...
                hl.TelescopeBorder = { fg = c.fg_dark, bg = nil }
                -- but this clears the results window border...
                hl.FloatBorder = { fg = c.fg_dark, bg = nil }
                -- and this clears the preview window border??
                hl.NormalFloat = { fg = c.fg_dark, bg = nil }
                hl.FloatTitle = { fg = c.fg_float, bg = nil }
            end,
        },
        _requires = 'tokyonight',
        _themes = { 'tokyonight', 'tokyonight-night' },
    },
    {
        "tiagovla/tokyodark.nvim",
        opts = {
            transparent_background = TRANSPARENT,
        },
        _requires = 'tokyodark',
        _themes = { 'tokyodark' },
    },
    {
        "EdenEast/nightfox.nvim",
        opts = {
            options = {
                transparent = TRANSPARENT,
                dim_inactive = true,
            },
            -- https://github.com/EdenEast/nightfox.nvim/issues/297#issuecomment-1379780655
            groups = {
                all = {
                    NormalFloat = { fg = "fg1", bg = "NONE" },
                    -- solves issue where opening telescope hides background image
                    NormalNC = { fg = "fg1", bg = "NONE" },
                    CursorLineNr = { style = "NONE" },
                    TreesitterContextLineNumber = { link = "CursorLineNr" }
                },
            },
        },
        _requires = 'nightfox',
        _themes = { 'nightfox', 'carbonfox', 'duskfox' },
    },
    {
        "rebelot/kanagawa.nvim",
        opts = {
            transparent = TRANSPARENT,
        },
        _requires = 'kanagawa',
        _themes = { 'kanagawa' },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = TRANSPARENT,
        },
        _requires = 'catppuccin',
        _themes = { 'catppuccin-mocha' },
    },
    {
        "webhooked/kanso.nvim",
        opts = {
            transparent = TRANSPARENT,
        },
        _requires = 'kanso',
        _themes = { 'kanso-zen' },
    },
}

-- auto-configure lazy-loading of themes
for _, cs in ipairs(colorschemes) do
    local lazy = true
    for _, theme in ipairs(cs._themes) do
        if theme == DEFAULT_THEME then
            cs.priority = 1000
            cs.lazy = false
            cs.config = function(_, opts)
                if opts ~= nil then
                    require(cs._requires).setup(opts)
                end
                vim.cmd('colorscheme' .. ' ' .. theme)
            end

            lazy = false
            break
        end
    end

    if lazy then
        cs.lazy = true
    end
end

return colorschemes
