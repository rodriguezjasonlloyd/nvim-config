return {
    "mfussenegger/nvim-lint",
    cond = true,
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            lua = { "selene" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertEnter", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
