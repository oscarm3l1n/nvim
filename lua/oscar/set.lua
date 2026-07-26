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

-- Use PowerShell as the default shell for :terminal (and :!, :read, etc.)
-- Only Windows PowerShell 5.1 is installed; swap "powershell" for "pwsh" if
-- you install PowerShell 7 later.
vim.o.shell = "powershell"
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.o.shellquote = ""
vim.o.shellxquote = ""

-- Use nvim for child processes (git commit, etc.); nvim-unception flattens any
-- nested nvim invocation from inside a :terminal into a buffer in this host
-- session instead of spawning a broken nested TUI.
vim.env.EDITOR = "nvim"
vim.env.VISUAL = "nvim"
