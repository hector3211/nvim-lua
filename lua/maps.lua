local keymap = vim.keymap
keymap.set('n', 'fp', ':NvimTreeToggle<Return>', { silent = true })

-- Buffers
keymap.set('n', "[w", ":BufferLineCycleNext<CR>")
keymap.set('n', "[q", ":BufferLineCyclePrev<CR>")
--Quit buffer
keymap.set('n', "<C-q>", ":bdelete<CR>")

-- netR_w
-- keymap.set('n', "fp", ":Lexplore %:p:h<CR>", { silent = true })
-- keymap.set('n', "fd", ":Lexplore<CR>", { silent = true })
