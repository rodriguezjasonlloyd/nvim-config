return {
    "stevearc/oil.nvim",
    cond = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {

        skip_confirm_for_simple_edits = true,
        constrain_cursor = "name",
        float = {
            padding = 4,
            max_width = 0.6,
        },
    },
    keys = {
        {
            "\\",
            function()
                require("oil").toggle_float()
            end,
            desc = "Toggle Oil Float",
        },
    },
}
