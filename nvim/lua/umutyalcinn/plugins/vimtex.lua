return {
    "lervag/vimtex",
        ft = { "tex", "plaintex", "latex" },
        init = function()
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_latexmk = {
                options = {
                    "-pdf",
                    "-pvc",
                    "-interaction=nonstopmode",
                    "-synctex=1",
                },
            }
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_activate = 1
            vim.keymap.set("n", "<leader>ll", "<plug>(vimtex-compile)")
            vim.keymap.set("n", "<leader>lk", "<plug>(vimtex-stop)")
            vim.keymap.set("n", "<leader>lv", "<plug>(vimtex-view)")
            vim.keymap.set("n", "<leader>le", "<plug>(vimtex-errors)")
    -- PDF viewer: use default, or set explicitly if you want
        -- vim.g.vimtex_view_method = "skim" -- macOS + Skim
        end,
}
