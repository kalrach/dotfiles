-- keys.lua

local wk = require("which-key")
local tb = require("telescope.builtin")
local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add
local telescope = require("telescope")
local smart_splits = require('smart-splits')

telescope.setup({
    defaults = {
        mappings = {
            i = { ["<c-t>"] = open_with_trouble },
            n = { ["<c-t>"] = open_with_trouble },
        },
    },
})

wk.add({
    { "<leader>f", group = "file" }, -- START File group
    { "<leader>ff", tb.find_files, desc = "Find File", mode = "n" },
    { "<leader>fg", tb.live_grep, desc = "Live Grep", mode = "n" },
    { "<leader>fb", tb.buffers, desc = "Buffers", mode = "n" },
    { "<leader>fh", tb.help_tags, desc = "Telescope Help Tags", mode = "n" },
    { "<leader>fs", tb.search_history, desc = "Telescope Search History", mode = "n" },
    { "<leader>d", group = "Diagnostics" }, -- START Diagnostics group
    { "<leader>dx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)", mode = "n" },
    { "<leader>dX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", mode = "n" },
    { "<leader>dl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", mode = "n" },
    { "<M-h>", smart_splits.move_cursor_left,  desc = "Move Left" },
    { "<M-j>", smart_splits.move_cursor_down,  desc = "Move Down" },
    { "<M-k>", smart_splits.move_cursor_up,    desc = "Move Up" },
    { "<M-l>", smart_splits.move_cursor_right, desc = "Move Right" },
    { "<M-S-h>", smart_splits.resize_left,     desc = "Resize Left" },
    { "<M-S-j>", smart_splits.resize_down,     desc = "Resize Down" },
    { "<M-S-k>", smart_splits.resize_up,       desc = "Resize Up" },
    { "<M-S-l>", smart_splits.resize_right,    desc = "Resize Right" },
})
