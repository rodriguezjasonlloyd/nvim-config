return {
    "shaunsingh/nord.nvim",
    cond = true,
    lazy = false,
    opts = {},
    config = function()
        vim.cmd("colorscheme nord")
    end,
    priority = 1000,
}
