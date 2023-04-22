-- Setup leader keys. <LocalLeader> is to be used for mappings which are local to a buffer.
vim.g.mapleader = ','
vim.g.maplocalleader = ','


-- Enable line numbers and relative position
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight on search
vim.opt.hlsearch = true

-- Number of spaces that a <Tab> in the file counts for.
vim.opt.tabstop = 4

-- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>.
vim.opt.softtabstop = 4

-- Number of spaces to use for each step of (auto)indent.
vim.opt.shiftwidth = 4

vim.opt.clipboard = 'unnamedplus'

-- menu		only shown when there is more than one match
-- menuone	when there is only one match.
-- preview	show extra information about the currently selected completion in the preview window.
vim.opt.completeopt = {'menu', 'menuone', 'preview', 'noselect'}

-- Mouse support for [a]ll Vim modes
vim.opt.mouse = 'a'

-- Save undo history
vim.opt.undofile = true

-- vim.g.loaded_netrw = 0 -- disable netrw
-- vim.g.loaded_netrwPlugin = 0 -- disable netrw
-- vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 0
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_altv = 1
-- vim.g.netrw_preview = 1
-- vim.g.netrw_winsize = 80

-- Always show sign column
vim.opt.signcolumn = 'yes'

vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.opt.termguicolors = true


-- Save all changes when pressing Ctrl+s
-- vim.keymap.set('i', '<C-s>', '<Esc>:wa<CR>')
vim.keymap.set({'n', 'i', 'v', 's'}, '<C-s>', '<CMD>wa<CR><ESC>')

-- Change from insert to normal mode inside terminal buffer
vim.keymap.set('t', '<Esc>', '<C-\\><c-n>')
