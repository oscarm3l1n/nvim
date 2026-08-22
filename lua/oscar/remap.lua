vim.g.mapleader = " "

-- ─── General ───────────────────────────────────────────────────────────────────

vim.keymap.set("n", "<leader>e", function()
    vim.diagnostic.open_float(nil, { focusable = true })
end, { desc = "Show diagnostic msgs in a floating window" })


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

vim.keymap.set("n", "<leader>f", function()
    vim.cmd("write")
    local file = vim.fn.expand("%:p")
    local result = vim.fn.system({ "clang-format", "-i", file })
    if vim.v.shell_error ~= 0 then
        vim.notify("clang-format failed: " .. result, vim.log.levels.ERROR)
    else
        vim.cmd("edit!")
    end
end, { desc = "Format file with clang-format" })

local build_buf = -1
local build_job_id = 0

vim.keymap.set("n", "<leader>b", function()
    local alive = build_buf > 0
        and vim.api.nvim_buf_is_valid(build_buf)
        and vim.fn.jobwait({ build_job_id }, 0)[1] == -1  -- -1 = still running

    if not alive then
        vim.cmd("new")
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 15)
        build_job_id = vim.fn.termopen({ "cmd.exe" }, { cwd = vim.fn.getcwd() })
        build_buf = vim.api.nvim_get_current_buf()
    else
        -- reuse: make sure the buffer is visible
        local found = false
        for _, w in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(w) == build_buf then
                found = true
                break
            end
        end
        if not found then
            vim.cmd("botright split")
            vim.api.nvim_win_set_height(0, 15)
            vim.api.nvim_win_set_buf(0, build_buf)
        end
    end

    vim.fn.chansend(build_job_id, "cls\r\ncmake --build build-vs --config Debug --target run\r\n")
end, { desc = "Build project" })
