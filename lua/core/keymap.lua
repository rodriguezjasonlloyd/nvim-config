local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window Navigation
keymap("n", "<leader>sv", ":vsplit<CR>", opts) -- Vertical split
keymap("n", "<leader>sh", ":split<CR>", opts) -- Horizontal split
keymap("n", "<leader>sx", ":close<CR>", opts) -- Close window
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize Splits
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer Navigation
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bd<CR>", opts)

-- File Operations
keymap("n", "<leader>w", ":w<CR>", opts) -- Save
keymap("n", "<leader>q", ":q<CR>", opts) -- Quit
keymap("n", "<leader>Q", ":q!<CR>", opts) -- Quit all

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Diagnostics
keymap("n", "<leader>xx", function()
    vim.diagnostic.open_float({
        border = "rounded",
    })
end, opts)

-- LSP
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)
