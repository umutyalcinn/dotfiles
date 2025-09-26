vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Copy to clipboard
vim.keymap.set("v", "<leader>cb", "\"*y")
vim.keymap.set("n", "<leader>cb", "\"*y")

vim.keymap.set("n", "<leader>td", function() vim.cmd(":TodoTelescope") end)
