vim.opt_local.colorcolumn = "100"

-- Neovim's default formatoptions includes `t`, which auto-wraps text as you
-- type at `textwidth`. This is annoying inside Python strings/comments, so
-- disable it (colorcolumn stays as a purely visual guide).
vim.opt_local.formatoptions:remove("t")
