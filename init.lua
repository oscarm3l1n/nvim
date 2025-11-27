require("oscar")

require("oscar")

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

local job_id = 0

-- split vertically
vim.keymap.set("n", "<space>vt", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("L")
    local screen_width = vim.api.nvim_get_option('columns') -- Get total screen width
    local terminal_width = math.floor(screen_width * 0.5) -- Calculate 40% width
    vim.api.nvim_win_set_width(0, terminal_width) -- Set terminal width

    job_id = vim.bo.channel

    -- vim.fn.chansend(job_id, {"echo 'hi'\r\n"})
end)

-- split horizontally
vim.keymap.set("n", "<space>ht", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)

    job_id = vim.bo.channel

    -- vim.fn.chansend(job_id, {"echo 'hi'\r\n"})
end)
