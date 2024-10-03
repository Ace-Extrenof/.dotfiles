-- Transparency
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
    },
})

require("transparent").setup({ -- Optional, you don't have to run setup.
    groups = {                 -- table: default groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLine",
        "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
    },
    extra_groups = {},   -- table: additional groups that should be cleared
    exclude_groups = {}, -- table: groups you don't want to clear
})

-- Telescope

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ": Telescope live_grep<CR>")

vim.diagnostic.config({
    update_in_insert = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})

require("autoclose").setup()

require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
})

require("notify").setup({
    render = "minimal",
    background_colour = "#2E3440",
})

require("which-key").setup()

vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end)
vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
end)
vim.keymap.set("n", "<leader>ls", function()
    vim.lsp.buf.workspace_symbol()
end)
vim.keymap.set("n", "<leader>ld", function()
    vim.diagnostic.open_float()
end)
vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
end)
vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
end)
vim.keymap.set("n", "<leader>la", function()
    vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.references()
end)
vim.keymap.set("n", "<leader>lr", function()
    vim.lsp.buf.rename()
end)
vim.keymap.set("n", "<C-h>", function()
    vim.lsp.buf.signature_help()
end)
vim.keymap.set("n", "<leader>li", function()
    vim.lsp.buf.implementations()
end)

vim.opt.termguicolors = true

require("nvim-highlight-colors").setup({})

require("rose-pine").setup({
    variant = "auto",      -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true,        -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },

    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
})

local function getWords()
    return tostring(vim.fn.wordcount().words)
end

require "staline".setup {
    sections = {
        left = { '  ', 'mode', ' ', 'branch', ' ' },
        mid = { getWords },
        right = { 'file_name' }
    },
    mode_colors = {
        i = "#d4be98",
        n = "#84a598",
        c = "#8fbf7f",
        v = "#fc802d",
    },
    defaults = {
        true_colors = true,
        branch_symbol = " "
    }
}

require('gitsigns').setup()

require("solarized-osaka").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    transparent = true,     -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "normal",            -- style for sidebars, see below
        floats = "normal",              -- style for floating windows
    },
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false,             -- dims inactive windows
    lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
})
