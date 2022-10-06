local keymap = vim.keymap
keymap.set('n','<C-n>', ':NvimTreeToggle<Return>',{silent = true })

-- Buffers
keymap.set('n',"[w",":BufferLineCycleNext<CR>")
keymap.set('n',"[q",":BufferLineCyclePrev<CR>")
--Quit buffer
keymap.set('n',"<C-q>",":bdelete<CR>")
