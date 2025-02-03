return {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({})

        require("mason-lspconfig").setup({
            ensure_installed = {
                "jsonls",
                "lua_ls",
                "luau_lsp",
                "ts_ls",
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                -- Formatter
                "prettierd",
                "stylua",

                -- Linter
                "eslint_d",
                "selene",
            },
            auto_update = true,
        })
    end,
}
