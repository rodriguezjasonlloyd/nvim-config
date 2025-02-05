return {
    "stevearc/conform.nvim",
    cond = true,
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
            },
        })

        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            callback = function()
                conform.format()
            end,
        })
    end,
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format()
            end,
            desc = "Format Buffer",
        },
    },
}
