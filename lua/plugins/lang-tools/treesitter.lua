return {
    "nvim-treesitter/nvim-treesitter",
    cond = true,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "c",
            "json",
            "lua",
            "luau",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
            "python",
            "tsx",
            "typescript",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
