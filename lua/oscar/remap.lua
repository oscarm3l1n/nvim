vim.g.mapleader = " "

-- ─── General ───────────────────────────────────────────────────────────────────

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float(nil, { focusable = true })
end, { desc = "Show diagnostic msgs in a floating window" })

-- ─── Tabs  (<leader>b …) ───────────────────────────────────────────────────────

vim.keymap.set("n", "<leader>bn", "<cmd>tabnext<cr>",     { desc = "Next tab" })
vim.keymap.set("n", "<leader>bp", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

-- ─── Windows  (<leader>bw …) ──────────────────────────────────────────────────

vim.keymap.set("n", "<leader>bwk", "<c-w>k",       { desc = "Window up" })
vim.keymap.set("n", "<leader>bwj", "<c-w>j",       { desc = "Window down" })
vim.keymap.set("n", "<leader>bwh", "<c-w>h",       { desc = "Window left" })
vim.keymap.set("n", "<leader>bwl", "<c-w>l",       { desc = "Window right" })
vim.keymap.set("n", "<leader>bws", "<c-w>s",       { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>bwv", "<c-w>v",       { desc = "Split window vertically" })

-- Toggle maximize current window
local is_maximized = false
vim.keymap.set("n", "<leader>bwm", function()
    if is_maximized then
        vim.cmd("wincmd =")
        is_maximized = false
    else
        vim.cmd("wincmd |")
        vim.cmd("wincmd _")
        is_maximized = true
    end
end, { desc = "Toggle maximize window" })

-- ─── Terminal  (<leader>vt / <leader>ht) ──────────────────────────────────────

-- Exit terminal insert-mode with <Esc><Esc>
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Disable line numbers inside terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

local job_id = 0

vim.keymap.set("n", "<leader>vt", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("L")
    local screen_width = vim.api.nvim_get_option("columns")
    local terminal_width = math.floor(screen_width * 0.5)
    vim.api.nvim_win_set_width(0, terminal_width)
    job_id = vim.bo.channel
end, { desc = "Open vertical terminal split" })

vim.keymap.set("n", "<leader>ht", function()
    vim.cmd.new()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
    job_id = vim.bo.channel
end, { desc = "Open horizontal terminal split" })
