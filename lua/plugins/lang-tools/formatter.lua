return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.formatters_by_ft = {
            lua = { "stylua" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            callback = function()
                conform.format()
            end,
        })

        vim.keymap.set("n", "<leader>f", conform.format)
    end,
}
