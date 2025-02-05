return {
    "neovim/nvim-lspconfig",
    cond = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["jsonls"] = function()
                lspconfig["jsonls"].setup({})
            end,
            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                })
            end,
            ["luau_lsp"] = function()
                lspconfig["luau_lsp"].setup({})
            end,
            ["ts_ls"] = function()
                lspconfig["ts_ls"].setup({
                    capabilities = capabilities,
                })
                vim.keymap.set("n", "<leader>oi", function()
                    for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
                        client:exec_cmd({
                            command = "_typescript.organizeImports",
                            arguments = { vim.api.nvim_buf_get_name(0) },
                            title = "",
                        }, { bufnr = 0 }, function(err)
                            if err then
                                vim.notify("Error organizing imports: " .. err.message, vim.log.levels.ERROR)
                            else
                                vim.notify("Imports organized successfully!", vim.log.levels.INFO)
                            end
                        end)
                    end
                end, { noremap = true, silent = true })
            end,
        })
    end,
}
