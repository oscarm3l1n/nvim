-- Compatibility shim: nvim-treesitter v1.0+ removed the configs module.
-- Telescope checks is_enabled("highlight", ...) before attaching — we just
-- report that highlighting is always available so it uses vim.treesitter directly.
local M = {}

function M.is_enabled(module, lang, bufnr)
  if module == "highlight" then
    -- Treat highlight as enabled if a parser exists for this language
    if lang then
      local ok = pcall(vim.treesitter.language.add, lang)
      return ok
    end
  end
  return false
end

function M.get_module(name)
  if name == "highlight" then
    return { additional_vim_regex_highlighting = false }
  end
  return {}
end

return M
