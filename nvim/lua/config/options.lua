-- leader
vim.g.mapleader = " "

-- colors
vim.opt.termguicolors = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- indentation
vim.opt.autoindent = false  -- treesitter for indentation
vim.opt.smartindent = false -- default -- treesitter for indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- line wrapping
vim.opt.wrap = false

-- scrolloff
vim.opt.scrolloff = 8

-- search
vim.opt.hlsearch = true  -- default
vim.opt.incsearch = true -- default
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- swapfiles
vim.opt.swapfile = false
vim.opt.backup = false -- default

-- ui
-- usable once https://github.com/neovim/neovim/issues/20380 is fixed
-- vim.opt.cmdheight = 0
vim.opt.showtabline = 0
vim.opt.pumheight = 10     -- for auto-complete popup menu
-- vim.opt.winborder = "single" -- adds border to bunch of random shit as well
vim.opt.signcolumn = "yes" -- prevent layout shift when adding/removing signs

-- cursor
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o-t:hor20"

-- controls column that `gq` wraps at
vim.opt.textwidth = 100
