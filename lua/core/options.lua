local opt = vim.opt
local g = vim.g

-- Leader keys
g.mapleader = " "
g.maplocalleader = " "

-- Fonts and UI Enhancements
opt.termguicolors = true -- Enable 24-bit colors
opt.cursorline = true -- Highlight current line
opt.signcolumn = "yes" -- Always show sign column to prevent shifting
opt.list = true -- Show hidden characters
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- Display whitespace characters
opt.showmode = false -- Hide mode in command line
opt.inccommand = "split" -- Live preview of substitutions
opt.breakindent = true -- Enable break indent for better readability

-- Line Numbers
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Relative line numbers for easy navigation

-- Indentation & Tabs
opt.tabstop = 4 -- Number of spaces per tab
opt.shiftwidth = 4 -- Indentation level
opt.expandtab = true -- Convert tabs to spaces
opt.smartindent = true -- Smart auto-indentation

-- Wrapping & Scrolling
opt.wrap = false -- Disable line wrapping
opt.scrolloff = 10 -- Keep cursor centered with space around
opt.sidescrolloff = 8 -- Keep horizontal spacing when scrolling

-- Mouse & Clipboard
opt.mouse = "a" -- Enable mouse support
vim.schedule(function()
    opt.clipboard = "unnamedplus" -- Sync OS clipboard with Neovim
end)

-- Search Settings
opt.ignorecase = true -- Ignore case in search
opt.smartcase = true -- Case-sensitive if search contains uppercase

-- Splits
opt.splitbelow = true -- Open new splits below
opt.splitright = true -- Open new vertical splits to the right

-- Undo & Backup
opt.undofile = true -- Enable persistent undo

-- Performance Tweaks
opt.updatetime = 250 -- Faster completion updates
opt.timeoutlen = 300 -- Reduce timeout for faster response

-- Session
vim.o.sessionoptions = "blank,buffers,curdir,folds,localoptions"

-- Terminal
local shell = "pwsh"
if vim.fn.executable(shell) == 1 then
    opt.shell = shell
else
    print("Shell not found: " .. shell)
end

-- Colorscheme
g.nord_contrast = true
g.nord_borders = true
g.nord_uniform_diff_background = true

-- Diagnostics
vim.diagnostic.config({
    update_in_insert = true,
})
