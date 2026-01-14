return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    modes = {
        test = {
            mode = "diagnostics",
            preview = {
                type = "split",
                relative = "win",
                position = "right",
                size = 0.3,
            },
        },
    },
}
