vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.cmd([[silent! %s/\r//g]])
    end,
})

local group = vim.api.nvim_create_augroup("highlight-yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.hl.on_yank()
    end,
})
