return {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("tokyonight")
        -- vim.cmd("colorscheme none")
        -- vim.cmd("hi clear")
        --
        vim.api.nvim_set_hl(0, "@string",      { link = "String" })
        vim.api.nvim_set_hl(0, "@keyword",     { link = "Keyword" })
        vim.api.nvim_set_hl(0, "@comment",     { link = "Comment" })
        vim.api.nvim_set_hl(0, "@function",    { link = "Function" })
        vim.api.nvim_set_hl(0, "@variable",    { link = "Identifier" })
        vim.api.nvim_set_hl(0, "@variable.builtin",    { link = "Identifier" })
        vim.api.nvim_set_hl(0, "@variable.builtin",    { link = "Type" })
        vim.api.nvim_set_hl(0, "@variable",    { link = "typescriptIdentifierName" })
        vim.api.nvim_set_hl(0, "@type.typescript",    { link = "@none" })
        vim.api.nvim_set_hl(0, "@constant",    { link = "@none" })
        vim.api.nvim_set_hl(0, "@operator.typescript",    { link = "typescriptBinaryOp" })
        vim.api.nvim_set_hl(0, "@punctuation", { link = "Delimiter" })
        vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "typescriptBlock" })
        vim.api.nvim_set_hl(0, "@number",      { link = "Number" })

        vim.api.nvim_set_hl(0, "@punctuation.paren", { link = "Normal" }) -- ユーザー定義
        vim.api.nvim_set_hl(0, "@punctuation.brace", { link = "Function" }) -- ユーザー定義

        vim.api.nvim_set_hl(0, "@keyword.var_declare", { link = "Identifier" }) -- ユーザー定義
        vim.api.nvim_set_hl(0, "@keyword.arrow", { link = "Type" }) -- ユーザー定義

        vim.api.nvim_set_hl(0, "@punctuation.bracket",      { link = "@none" })
        vim.api.nvim_set_hl(0, "@punctuation.bracket.args", { link = "@none" }) -- ユーザー定義
        vim.api.nvim_set_hl(0, "@punctuation.bracket.import", { link = "Function" }) -- ユーザー定義
        vim.api.nvim_set_hl(0, "@punctuation.bracket.array", { link = "Normal" }) -- ユーザー定義
        vim.api.nvim_set_hl(0, "@punctuation.bracket.object", { link = "Function" }) -- ユーザー定義
        vim.api.nvim_set_hl(0, "@punctuation.bracket.object_type", { link = "Function" }) -- ユーザー定義
        vim.api.nvim_set_hl(0, "@punctuation.special", { link = "Statement" })

        vim.api.nvim_set_hl(0, "@keyword.import", { link = "Special" })
        vim.api.nvim_set_hl(0, "@keyword.return", { link = "Statement" })
        vim.api.nvim_set_hl(0, "@string.escape", { link = "Special" })
        vim.api.nvim_set_hl(0, "@variable.member", { link = "@none" })
        vim.api.nvim_set_hl(0, "@function.method.call", { link = "@none" })
        vim.api.nvim_set_hl(0, "@function.method", { link = "@none" })
        vim.api.nvim_set_hl(0, "@keyword.conditional.ternary", { link = "@none" })
    end,
}
