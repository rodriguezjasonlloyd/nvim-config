return {
    "neovim/nvim-lspconfig",
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
                local function organize_imports()
                    local params = {
                        command = "_typescript.organizeImports",
                        arguments = { vim.api.nvim_buf_get_name(0) },
                        title = "",
                    }
                    for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
                        client:exec_cmd(params, { bufnr = 0 }, function(err, result)
                            if err then
                                vim.notify("Error organizing imports: " .. err.message, vim.log.levels.ERROR)
                            else
                                vim.notify("Imports organized successfully!", vim.log.levels.INFO)
                            end
                        end)
                    end
                end
                lspconfig["ts_ls"].setup({
                    capabilities = capabilities,
                })
                vim.keymap.set("n", "<leader>oi", organize_imports, { noremap = true, silent = true })
            end,
        })
    end,
}
