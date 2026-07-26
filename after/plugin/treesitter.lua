-- nvim-treesitter v1.0+ (rewrite) — the old configs module is gone.
-- Highlighting is now built into neovim; this plugin only provides parsers/queries.
require('nvim-treesitter').setup()

-- Auto-install parsers for these languages on first open
local ensure_installed = {
  "python", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then return end
    local ok = pcall(vim.treesitter.language.add, lang)
    if not ok then
      require('nvim-treesitter.install').install({ lang })
    end
  end,
})

-- Install the explicit list up front (runs once; skips already-installed parsers)
require('nvim-treesitter.install').install(ensure_installed)
