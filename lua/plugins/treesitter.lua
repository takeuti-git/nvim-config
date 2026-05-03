return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = {
                "lua",
                "c",
                "jinja2",
                "python",
                "javascript",
                "typescript",
                "html",
                "json"
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
