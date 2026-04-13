-- lua/plugins/lsp.lua
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        -----------------------------------------
        -- LspAttach
        -----------------------------------------
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = { buffer = args.buf }
                vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, opts)
            end,
        })

        -----------------------------------------
        -- Mason
        -----------------------------------------
        require("mason").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    vim.lsp.config(server_name, {
                        capabilities = capabilities,
                    })
                end,
            },
        })

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT", },
                    workspace = {
                        library = { vim.env.VIMRUNTIME, },
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false, },
                },
            },
        })

        ------------------------------------
        -- FileType起動
        ------------------------------------

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local ft = vim.bo[args.buf].filetype
                for _, cfg in pairs(vim.lsp.config) do
                    if cfg.cmd and vim.tbl_contains(cfg.filetypes or {}, ft)
                    then
                        vim.lsp.start(cfg, { bufnr = args.buf })
                    end
                end
            end
        })

        -- diagnostic
        vim.diagnostic.config({
            -- virtual_text = {
            --     spacing = 2,
            --     source = "if_many",
            --     prefix = "●", -- 任意
            -- },
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,

            float = {
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },

            jump = {
                float = true,
            }
        })

        vim.api.nvim_create_user_command("LspRename", function(opts)
            vim.lsp.buf.rename(opts.args)
        end, { nargs = 1 })

        vim.keymap.set("n", "<leader>re", function()
            local current = vim.fn.expand("<cword>")
            vim.api.nvim_create_autocmd("CmdwinEnter", {
                once = true,
                callback = function()
                    vim.api.nvim_buf_set_lines(0, -1, -1, false, { "LspRename: " .. current })
                    vim.cmd("normal! G$")
                end,
            })
            vim.fn.feedkeys("q:", "n")
        end, { desc = "LSP Rename Symbol" })
    end,
}
