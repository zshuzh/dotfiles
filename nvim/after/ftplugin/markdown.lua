vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Disable hard line-breaking at textwidth. Neovim's built-in markdown ftplugin
-- sets formatoptions+=t and textwidth=79, which auto-wraps text as you type.
vim.opt_local.formatoptions:remove("t")
