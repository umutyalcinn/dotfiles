return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')

            local harpoon = require('harpoon')

            harpoon:setup()

            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>pn', function() builtin.find_files({ search_dirs = {"~/MyNotes"}}) end, {})
            vim.keymap.set('n', '<leader>a', function () harpoon:list():add() end)
            vim.keymap.set('n', '<C-e>', function () harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        end,
        lazy = false,
    }
}
