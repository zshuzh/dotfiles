-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without copying replaced text
vim.keymap.set("x", "p", [["_dP]])

-- copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- quit
vim.keymap.set({ "n", "v" }, "<leader>w", ":q<CR>")
vim.keymap.set({ "n", "v" }, "<leader>q", ":qa!<CR>")

-- cycle through panes
-- don't do this because <Tab> == <C-i>
-- vim.keymap.set("n", "<Tab>", "<C-w>w")
-- vim.keymap.set("n", "<S-Tab>", "<C-w>W")

-- splits
vim.keymap.set("n", "<leader>L", function()
    vim.cmd.vsplit()
    vim.cmd.wincmd("l")
end)
vim.keymap.set("n", "<leader>J", function()
    vim.cmd.split()
    vim.cmd.wincmd("j")
end)
