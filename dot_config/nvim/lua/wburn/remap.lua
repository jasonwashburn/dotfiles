local nnoremap = require("wburn.keymap").nnoremap

nnoremap("<leader>ls", "<cmd>Ex<CR>")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("<C-_>", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top theme=ivy<cr>")
