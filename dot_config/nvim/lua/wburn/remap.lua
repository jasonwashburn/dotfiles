local nnoremap = require("wburn.keymap").nnoremap
local tnoremap = require("wburn.keymap").tnoremap
nnoremap("<leader>d", "<cmd>Ex<CR>")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("<C-_>", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top theme=ivy<cr>")


nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>e", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<leader>j", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>k", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>l", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>;", function() require("harpoon.ui").nav_file(4) end, silent)
nnoremap("<leader>t", function() require("harpoon.term").gotoTerminal(1) end, silent)

tnoremap("<Esc>", "<C-\\><C-n>")
