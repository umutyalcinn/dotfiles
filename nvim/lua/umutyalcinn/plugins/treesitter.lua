return {
    'nvim-treesitter/nvim-treesitter',
    opt = {
        ensure_installed = { 'blade' },
        highlight = {
            enable = true,
        }
    },
    config = function()
        vim.cmd("TSUpdate")
    end
}
