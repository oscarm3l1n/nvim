-- Compatibility shim: nvim-treesitter v1.0+ removed the parsers module.
-- Telescope (and other old plugins) still require it, so we stub the pieces
-- they use so they degrade gracefully instead of erroring.
local M = {}

function M.ft_to_lang(ft)
  -- Delegate to the built-in nvim 0.10+ API
  if vim.treesitter and vim.treesitter.language and vim.treesitter.language.get_lang then
    return vim.treesitter.language.get_lang(ft) or ft
  end
  return ft
end

function M.get_parser(bufnr, lang)
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
  if ok then return parser end
  return nil
end

function M.has_parser(lang)
  local ok = pcall(vim.treesitter.language.add, lang)
  return ok
end

return M
