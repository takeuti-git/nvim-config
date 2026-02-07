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
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            end,
        })

        -----------------------------------------
        -- Mason
        -----------------------------------------
        require("mason").setup()

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            },
        })

        lspconfig.lua_ls.setup({
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

        -- vim.api.nvim_create_autocmd("FileType", {
        --     callback = function(args)
        --         for _, cfg in pairs(vim.lsp.config) do
        --             vim.lsp.start(cfg, { bufnr = args.buf })
        --         end
        --     end,
        -- })
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
            virtual_text = {
                spacing = 2,
                source = "if_many",
                prefix = "●", -- 任意
            },
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })
    end,
}
