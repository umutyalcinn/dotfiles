return { 
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>gg", function()
            vim.cmd("Git")
        end)

        vim.keymap.set("n", "<leader>dif", function()
            vim.cmd("Gvdiffsplit")
        end)

        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd("Git push")
        end)

        vim.keymap.set("n", "<leader>gb", function()
            vim.cmd("Git branch")
        end)

        vim.keymap.set("n", "<leader>gl", function()
            vim.cmd("Git log")
        end)
    end
}
