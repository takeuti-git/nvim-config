local opt = vim.opt

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'

-- lines & numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 8

-- indent
opt.smartindent = true
opt.autoindent = true

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- visuals
vim.g.have_nerd_font = true
-- opt.showmode = true -- mode(NORMAL, INSERT, VISUAL)を画面下に表示
opt.signcolumn = 'yes' -- 行番号左側の余白。LSP,git,breakpointなどに使用

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- search
opt.ignorecase = true
opt.smartcase = true

-- clipboard
opt.clipboard = 'unnamedplus' -- 'unnamedplus': OSでクリップボードを同期

-- files
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.autowrite = true
opt.autowriteall = true

-- mouse
opt.mouse = 'a'

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 1000

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

