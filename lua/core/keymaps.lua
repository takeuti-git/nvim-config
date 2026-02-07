local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- insert
map('i', 'jj', '<Esc>')

-- movement
map('n', 'H', '0')
-- map('n', 'J', '10j')
-- map('n', 'K', '10k')
map('n', 'L', '$')

-- clear search
map('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

map("n", "<leader>s", "<cmd>split<CR>")
map("n", "<leader>v", "<cmd>vsplit<CR>")
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")


map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '*', '*zz')
map('n', '#', '#zz')

-- ~/.config/nvim/init.luaを開く
map('n', '<leader>init', ':edit $MYVIMRC<CR>')

-- netrw
map("n", "<leader>e", "<cmd>Ex<CR>")


local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help" })

-- TIP: Disable arrow keys in normal mode
map({"n", "i"}, '<left>', '<cmd>echo "Use h to move!!"<CR>')
map({"n", "i"}, '<right>', '<cmd>echo "Use l to move!!"<CR>')
map({"n", "i"}, '<up>', '<cmd>echo "Use k to move!!"<CR>')
map({"n", "i"}, '<down>', '<cmd>echo "Use j to move!!"<CR>')

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
