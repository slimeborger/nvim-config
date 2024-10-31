-- A list of all the options changed in Neovim

-- Formatting: Indents, formats

-- Smart or C Indenting
vim.opt.cindent = true
-- Sets 'hard tabs' i.e. pressing the <Tab> key creates x spaces
-- KEEP THIS AT 8 AT ALL TIMES. shit breaks otherwise!
vim.opt.tabstop = 4
-- How many spaces are deleted if you try to edit a <Tab> character
-- Keep this the same as [shiftwidth] for happy times.
vim.opt.softtabstop = 4
-- How many spaces is indent by Neovim's automatic indenter
-- (auto-indent). Keep this same as [softtabstop].
vim.opt.shiftwidth = 4

-- Scrolling

-- Minimum lines to have above and below cursor when scrolling
vim.opt.scrolloff = 5

-- Display: Colours, Highlights & Special Chars

-- Highlight the line cursor is on
vim.opt.cursorline = true
-- Don't show highlights after search (:s) is done 
vim.opt.hlsearch = false
-- Change the default ~ that shows on empty, non-written lines
vim.opt.fillchars = "eob:>"
--Add line numbers
vim.opt.number = true
-- Add a highlighted column to encforce good code practice
vim.opt.colorcolumn = "80"

-- Windows: Multitasking

-- Minimum lines the currently focused window must have
vim.opt.winheight = 10
-- Minimum lines every window must have
vim.opt.winminheight = 5
-- Pairs a window to a buffer, always (??)
-- Has some issues, keep disabled.
--vim.opt.winfixbuf = true

-- Mouse

-- Choose what modes mouse 'works' in
vim.opt.mouse = "nv"
-- Window autofocus on mouse enter
vim.opt.mousefocus = true

-- Cut, Copy, Paste

-- Use system clipboard instead of *
vim.opt.clipboard = "unnamedplus"

-- File Handling: Saving

-- Confirm before exit without saving?
vim.opt.confirm = true

-- Misc

-- Turn off swap files
vim.opt.swapfile = false

--Change cursor hold update time
vim.opt.updatetime = 500
