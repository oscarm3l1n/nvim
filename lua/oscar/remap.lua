vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float(nil, { focusable = true })
end, { desc = "Show diagnostic msgs in a floating window" })
