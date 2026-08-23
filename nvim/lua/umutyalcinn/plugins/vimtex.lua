return {
    "lervag/vimtex",
        ft = { "tex", "plaintex", "latex" },
        init = function()

            vim.g.vimtex_syntax_conceal_disable = 1

            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_latexmk = {
                options = {
                    "-pvc",
                    "-interaction=nonstopmode",
                    "-synctex=1",
                },
            }
            local sysname = (vim.uv or vim.loop).os_uname().sysname

            if sysname == "Darwin" then
                vim.g.vimtex_view_method = "skim"
                vim.g.vimtex_view_skim_sync = 1
                vim.g.vimtex_view_skim_activate = 1
            elseif sysname == "Linux" then
                vim.g.vimtex_view_method = "mupdf"
            end
        end,
    config = function()
        vim.keymap.set("n", "<leader>ll", "<plug>(vimtex-compile)")
        vim.keymap.set("n", "<leader>lk", "<plug>(vimtex-stop)")
        vim.keymap.set("n", "<leader>lv", "<plug>(vimtex-view)")
        vim.keymap.set("n", "<leader>le", "<plug>(vimtex-errors)")
    end,
}
