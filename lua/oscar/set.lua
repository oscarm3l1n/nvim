vim.opt.guicursor = ""
-- vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- Use Git Bash as the default shell for :terminal (and :!, :read, etc.)
-- Prepend Git's bin dir to PATH so plain "bash" resolves without needing the
-- full "C:/Program Files/..." path (which nvim's shell option can't handle
-- due to the space, even when escaped).
vim.env.PATH = "C:\\Program Files\\Git\\bin;" .. vim.env.PATH
vim.o.shell = "bash"
vim.o.shellcmdflag = "-c"
vim.o.shellredir = "> %s 2>&1"
vim.o.shellpipe = "2>&1 | tee %s"
vim.o.shellquote = ""
vim.o.shellxquote = ""

-- Use nvim for child processes (git commit, etc.); nvim-unception flattens any
-- nested nvim invocation from inside a :terminal into a buffer in this host
-- session instead of spawning a broken nested TUI.
vim.env.EDITOR = "nvim"
vim.env.VISUAL = "nvim"
