-- Default Leader Key is <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Press P to only paste from yank register (deleted stuff doesn't get pasted!)
vim.keymap.set("n", "P", '"0p')

--Split lines (opposite of J)
vim.keymap.set("n", "K", "i<CR><esc>k$")

-- -- Allows tabs and shift-tab to indent in Visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

--Easy escape out of terminal insert mode,
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

-- Make wqa quit even if terminals are open
vim.cmd("command WQA wa | qa")
vim.cmd("cabbrev wqa WQA")

vim.cmd("cabbrev config :cd $nvim")

-- TODO: Plugin specific keymaps

